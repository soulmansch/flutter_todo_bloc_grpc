//
//  Generated code. Do not modify.
//  source: task_item.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'task_item.pbenum.dart';

export 'task_item.pbenum.dart';

class EmptyMessage_grpc extends $pb.GeneratedMessage {
  factory EmptyMessage_grpc() => create();
  EmptyMessage_grpc._() : super();
  factory EmptyMessage_grpc.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyMessage_grpc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmptyMessage_grpc', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo_grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmptyMessage_grpc clone() => EmptyMessage_grpc()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmptyMessage_grpc copyWith(void Function(EmptyMessage_grpc) updates) => super.copyWith((message) => updates(message as EmptyMessage_grpc)) as EmptyMessage_grpc;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmptyMessage_grpc create() => EmptyMessage_grpc._();
  EmptyMessage_grpc createEmptyInstance() => create();
  static $pb.PbList<EmptyMessage_grpc> createRepeated() => $pb.PbList<EmptyMessage_grpc>();
  @$core.pragma('dart2js:noInline')
  static EmptyMessage_grpc getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyMessage_grpc>(create);
  static EmptyMessage_grpc? _defaultInstance;
}

class Timestamp_grpc extends $pb.GeneratedMessage {
  factory Timestamp_grpc() => create();
  Timestamp_grpc._() : super();
  factory Timestamp_grpc.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Timestamp_grpc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Timestamp_grpc', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo_grpc'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seconds')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'nanos', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Timestamp_grpc clone() => Timestamp_grpc()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Timestamp_grpc copyWith(void Function(Timestamp_grpc) updates) => super.copyWith((message) => updates(message as Timestamp_grpc)) as Timestamp_grpc;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timestamp_grpc create() => Timestamp_grpc._();
  Timestamp_grpc createEmptyInstance() => create();
  static $pb.PbList<Timestamp_grpc> createRepeated() => $pb.PbList<Timestamp_grpc>();
  @$core.pragma('dart2js:noInline')
  static Timestamp_grpc getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timestamp_grpc>(create);
  static Timestamp_grpc? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seconds => $_getI64(0);
  @$pb.TagNumber(1)
  set seconds($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeconds() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get nanos => $_getIZ(1);
  @$pb.TagNumber(2)
  set nanos($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNanos() => $_has(1);
  @$pb.TagNumber(2)
  void clearNanos() => clearField(2);
}

class TaskItem_grpc extends $pb.GeneratedMessage {
  factory TaskItem_grpc() => create();
  TaskItem_grpc._() : super();
  factory TaskItem_grpc.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskItem_grpc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskItem_grpc', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo_grpc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..e<TaskStatus_grpc>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TaskStatus_grpc.TASK_STATUS_PENDING, valueOf: TaskStatus_grpc.valueOf, enumValues: TaskStatus_grpc.values)
    ..aOM<Timestamp_grpc>(5, _omitFieldNames ? '' : 'created', subBuilder: Timestamp_grpc.create)
    ..aOM<Timestamp_grpc>(6, _omitFieldNames ? '' : 'lastModified', subBuilder: Timestamp_grpc.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskItem_grpc clone() => TaskItem_grpc()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskItem_grpc copyWith(void Function(TaskItem_grpc) updates) => super.copyWith((message) => updates(message as TaskItem_grpc)) as TaskItem_grpc;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskItem_grpc create() => TaskItem_grpc._();
  TaskItem_grpc createEmptyInstance() => create();
  static $pb.PbList<TaskItem_grpc> createRepeated() => $pb.PbList<TaskItem_grpc>();
  @$core.pragma('dart2js:noInline')
  static TaskItem_grpc getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskItem_grpc>(create);
  static TaskItem_grpc? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  TaskStatus_grpc get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(TaskStatus_grpc v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  Timestamp_grpc get created => $_getN(4);
  @$pb.TagNumber(5)
  set created(Timestamp_grpc v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);
  @$pb.TagNumber(5)
  Timestamp_grpc ensureCreated() => $_ensure(4);

  @$pb.TagNumber(6)
  Timestamp_grpc get lastModified => $_getN(5);
  @$pb.TagNumber(6)
  set lastModified(Timestamp_grpc v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastModified() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastModified() => clearField(6);
  @$pb.TagNumber(6)
  Timestamp_grpc ensureLastModified() => $_ensure(5);
}

class DeleteTaskResponse extends $pb.GeneratedMessage {
  factory DeleteTaskResponse() => create();
  DeleteTaskResponse._() : super();
  factory DeleteTaskResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo_grpc'), createEmptyInstance: create)
    ..aOM<TaskItem_grpc>(1, _omitFieldNames ? '' : 'deletedTask', subBuilder: TaskItem_grpc.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskResponse clone() => DeleteTaskResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskResponse copyWith(void Function(DeleteTaskResponse) updates) => super.copyWith((message) => updates(message as DeleteTaskResponse)) as DeleteTaskResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskResponse create() => DeleteTaskResponse._();
  DeleteTaskResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskResponse> createRepeated() => $pb.PbList<DeleteTaskResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskResponse>(create);
  static DeleteTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TaskItem_grpc get deletedTask => $_getN(0);
  @$pb.TagNumber(1)
  set deletedTask(TaskItem_grpc v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeletedTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeletedTask() => clearField(1);
  @$pb.TagNumber(1)
  TaskItem_grpc ensureDeletedTask() => $_ensure(0);
}

class TaskList extends $pb.GeneratedMessage {
  factory TaskList() => create();
  TaskList._() : super();
  factory TaskList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskList', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo_grpc'), createEmptyInstance: create)
    ..pc<TaskItem_grpc>(1, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: TaskItem_grpc.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskList clone() => TaskList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskList copyWith(void Function(TaskList) updates) => super.copyWith((message) => updates(message as TaskList)) as TaskList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskList create() => TaskList._();
  TaskList createEmptyInstance() => create();
  static $pb.PbList<TaskList> createRepeated() => $pb.PbList<TaskList>();
  @$core.pragma('dart2js:noInline')
  static TaskList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskList>(create);
  static TaskList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskItem_grpc> get tasks => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
