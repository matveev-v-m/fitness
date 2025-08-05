// This is a generated file - do not edit.
//
// Generated from trainer.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);

  factory Empty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'trainers'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => Empty()..mergeFromMessage(this);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();

  @$core.override
  Empty createEmptyInstance() => create();

  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();

  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Department extends $pb.GeneratedMessage {
  factory Department({
    $core.String? id,
    $core.String? title,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    return result;
  }

  Department._();

  factory Department.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);

  factory Department.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Department',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'trainers'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Department clone() => Department()..mergeFromMessage(this);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Department copyWith(void Function(Department) updates) =>
      super.copyWith((message) => updates(message as Department)) as Department;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Department create() => Department._();

  @$core.override
  Department createEmptyInstance() => create();

  static $pb.PbList<Department> createRepeated() => $pb.PbList<Department>();

  @$core.pragma('dart2js:noInline')
  static Department getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Department>(create);
  static Department? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);

  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);

  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);
}

class TrainerProto extends $pb.GeneratedMessage {
  factory TrainerProto({
    $core.int? id,
    $core.String? name,
    Department? typeOfSpecialization,
    $core.String? trainerType,
    $core.String? description,
    $core.String? imagePath,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (typeOfSpecialization != null)
      result.typeOfSpecialization = typeOfSpecialization;
    if (trainerType != null) result.trainerType = trainerType;
    if (description != null) result.description = description;
    if (imagePath != null) result.imagePath = imagePath;
    return result;
  }

  TrainerProto._();

  factory TrainerProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);

  factory TrainerProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainerProto',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'trainers'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<Department>(3, _omitFieldNames ? '' : 'typeOfSpecialization',
        protoName: 'typeOfSpecialization', subBuilder: Department.create)
    ..aOS(4, _omitFieldNames ? '' : 'trainerType', protoName: 'trainerType')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'imagePath', protoName: 'imagePath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainerProto clone() => TrainerProto()..mergeFromMessage(this);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainerProto copyWith(void Function(TrainerProto) updates) =>
      super.copyWith((message) => updates(message as TrainerProto))
          as TrainerProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainerProto create() => TrainerProto._();

  @$core.override
  TrainerProto createEmptyInstance() => create();

  static $pb.PbList<TrainerProto> createRepeated() =>
      $pb.PbList<TrainerProto>();

  @$core.pragma('dart2js:noInline')
  static TrainerProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainerProto>(create);
  static TrainerProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);

  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);

  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);

  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  Department get typeOfSpecialization => $_getN(2);

  @$pb.TagNumber(3)
  set typeOfSpecialization(Department value) => $_setField(3, value);

  @$pb.TagNumber(3)
  $core.bool hasTypeOfSpecialization() => $_has(2);

  @$pb.TagNumber(3)
  void clearTypeOfSpecialization() => $_clearField(3);

  @$pb.TagNumber(3)
  Department ensureTypeOfSpecialization() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get trainerType => $_getSZ(3);

  @$pb.TagNumber(4)
  set trainerType($core.String value) => $_setString(3, value);

  @$pb.TagNumber(4)
  $core.bool hasTrainerType() => $_has(3);

  @$pb.TagNumber(4)
  void clearTrainerType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);

  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);

  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);

  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get imagePath => $_getSZ(5);

  @$pb.TagNumber(6)
  set imagePath($core.String value) => $_setString(5, value);

  @$pb.TagNumber(6)
  $core.bool hasImagePath() => $_has(5);

  @$pb.TagNumber(6)
  void clearImagePath() => $_clearField(6);
}

class DataResponse extends $pb.GeneratedMessage {
  factory DataResponse({
    $core.Iterable<TrainerProto>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  DataResponse._();

  factory DataResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);

  factory DataResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DataResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'trainers'),
      createEmptyInstance: create)
    ..pc<TrainerProto>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: TrainerProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DataResponse clone() => DataResponse()..mergeFromMessage(this);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DataResponse copyWith(void Function(DataResponse) updates) =>
      super.copyWith((message) => updates(message as DataResponse))
          as DataResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DataResponse create() => DataResponse._();

  @$core.override
  DataResponse createEmptyInstance() => create();

  static $pb.PbList<DataResponse> createRepeated() =>
      $pb.PbList<DataResponse>();

  @$core.pragma('dart2js:noInline')
  static DataResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DataResponse>(create);
  static DataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TrainerProto> get items => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
