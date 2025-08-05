// This is a generated file - do not edit.
//
// Generated from trainer.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'trainer.pb.dart' as $0;

export 'trainer.pb.dart';

@$pb.GrpcServiceName('trainers.TrainerService')
class TrainerServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  TrainerServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.DataResponse> getTrainers(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTrainers, request, options: options);
  }

  // method descriptors

  static final _$getTrainers = $grpc.ClientMethod<$0.Empty, $0.DataResponse>(
      '/trainers.TrainerService/GetTrainers',
      ($0.Empty value) => value.writeToBuffer(),
      $0.DataResponse.fromBuffer);
}

@$pb.GrpcServiceName('trainers.TrainerService')
abstract class TrainerServiceBase extends $grpc.Service {
  $core.String get $name => 'trainers.TrainerService';

  TrainerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.DataResponse>(
        'GetTrainers',
        getTrainers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.DataResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.DataResponse> getTrainers_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getTrainers($call, await $request);
  }

  $async.Future<$0.DataResponse> getTrainers(
      $grpc.ServiceCall call, $0.Empty request);
}
