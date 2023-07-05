const grpc = require("grpc");
const protoLoader = require("@grpc/proto-loader");
const os = require("os");

// Load the protobuf
const packageDefinition = protoLoader.loadSync("proto/task_item.proto", {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});
const taskItemProto = grpc.loadPackageDefinition(packageDefinition).todo_grpc;

// In-memory list of tasks
const tasks = [];

// Implement the gRPC service
const taskService = {
  CreateTask: createTask,
  UpdateTask: updateTask,
  DeleteTask: deleteTask,
  StreamUpdates: streamUpdates,
  GetTasks: getTasks,
};

// CreateTask RPC method
function createTask(call, callback) {
  const task = call.request;
  tasks.push(task);

  // Broadcast the newly created task to all connected clients
  broadcastTaskUpdate(task);

  // Send the created task as the response
  callback(null, task);
}

// UpdateTask RPC method
function updateTask(call, callback) {
  const updatedTask = call.request;

  // Find the task to update in the tasks list
  const taskIndex = tasks.findIndex((task) => task.id === updatedTask.id);
  if (taskIndex !== -1) {
    tasks[taskIndex] = updatedTask;

    // Broadcast the updated task to all connected clients
    broadcastTaskUpdate(updatedTask);
  }

  // Send the updated task as the response
  callback(null, updatedTask);
}

// DeleteTask RPC method
function deleteTask(call, callback) {
  const task = call.request;

  // Find the task to delete in the tasks list
  const taskIndex = tasks.findIndex((t) => t.id === task.id);
  if (taskIndex !== -1) {
    const deletedTask = tasks.splice(taskIndex, 1)[0];

    // Broadcast the deleted task to all connected clients
    broadcastTaskUpdate(deletedTask);
  }

  // Send an empty response
  callback(null, {});
}

// StreamUpdates RPC method
function streamUpdates(call) {
  // Send all existing tasks to the newly connected client
  tasks.forEach((task) => call.write(task));

  // Add the client to the list of active connections
  const client = {
    call,
    taskUpdates: [],
  };
  activeConnections.push(client);

  // Handle client disconnection
  call.on("end", () => {
    // Remove the client from the list of active connections
    const index = activeConnections.indexOf(client);
    if (index !== -1) {
      activeConnections.splice(index, 1);
    }
  });
}
function getTasks(call, callback) {
  const taskList = { tasks: tasks };
  callback(null, taskList);
}

// Broadcast task updates to all connected clients
function broadcastTaskUpdate(task) {
  // Iterate through all active connections and send the task update
  activeConnections.forEach((client) => {
    client.call.write(task);
  });
}

// List to keep track of active connections
const activeConnections = [];

// Get IP address of the device running the server
function getIpAddress() {
  const networkInterfaces = os.networkInterfaces();
  const interfaces = Object.values(networkInterfaces);

  for (const interfaceArray of interfaces) {
    for (const interfaceInfo of interfaceArray) {
      if (interfaceInfo.family === "IPv4" && !interfaceInfo.internal) {
        return interfaceInfo.address;
      }
    }
  }

  return "localhost";
}
// Get free ports
function getFreePort() {
  return new Promise((resolve, reject) => {
    const server = require("net").createServer();
    server.unref();
    server.on("error", reject);
    server.listen(0, () => {
      const port = server.address().port;
      server.close(() => resolve(port));
    });
  });
}

// Start the gRPC server
async function main() {
  const server = new grpc.Server();
  server.addService(taskItemProto.TaskService_grpc.service, taskService);
  const host = process.argv[2] || getIpAddress();
  const port = process.argv[3] || (await getFreePort());

  server.bindAsync(
    `${host}:${port}`,
    grpc.ServerCredentials.createInsecure(),
    (err, port) => {
      if (err) {
        console.error(`Failed to bind to ${host}:${port}. Error: ${err}`);
        return;
      }

      console.log(`Server running at http://${host}:${port}`);

      //   // Event listener for client connections
      //   server.on("connect", (socket) => {
      //     console.log("Client connected");
      //   });

      //   // Event listener for client disconnections
      //   server.on("disconnect", (socket) => {
      //     console.log("Client disconnected");
      //   });

      server.start();
    }
  );
}

main();
