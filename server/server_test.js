const grpc = require("grpc");
const protoLoader = require("@grpc/proto-loader");

// Load the protobuf definition
const packageDefinition = protoLoader.loadSync("proto/test.proto");
const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);

// Create a gRPC server
const server = new grpc.Server();

server.addService(protoDescriptor.todo_grpc_test.MyService.service, {
  MyMethod: (call, callback) => {
    const name = call.request.name;
    const response = { message: `Hello, ${name}!` };
    callback(null, response);
  },
});

// Start the server and bind it to a port
const host = "127.0.0.1";
const port = 50053;
server.bind(`${host}:${port}`, grpc.ServerCredentials.createInsecure());

// Start the server and listen for incoming connections
server.start();
console.log(`gRPC server running at ${host}:${port}`);
