// This is a generated file - do not edit.
//
// Generated from trainer.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use departmentDescriptor instead')
const Department$json = {
  '1': 'Department',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `Department`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List departmentDescriptor = $convert.base64Decode(
    'CgpEZXBhcnRtZW50Eg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGU=');

@$core.Deprecated('Use trainerProtoDescriptor instead')
const TrainerProto$json = {
  '1': 'TrainerProto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'typeOfSpecialization',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Department',
      '10': 'typeOfSpecialization'
    },
    {'1': 'trainerType', '3': 4, '4': 1, '5': 9, '10': 'trainerType'},
    {
      '1': 'description',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'description',
      '17': true
    },
    {
      '1': 'imagePath',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'imagePath',
      '17': true
    },
  ],
  '8': [
    {'1': '_description'},
    {'1': '_imagePath'},
  ],
};

/// Descriptor for `TrainerProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainerProtoDescriptor = $convert.base64Decode(
    'CgxUcmFpbmVyUHJvdG8SDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSPwoUdH'
    'lwZU9mU3BlY2lhbGl6YXRpb24YAyABKAsyCy5EZXBhcnRtZW50UhR0eXBlT2ZTcGVjaWFsaXph'
    'dGlvbhIgCgt0cmFpbmVyVHlwZRgEIAEoCVILdHJhaW5lclR5cGUSJQoLZGVzY3JpcHRpb24YBS'
    'ABKAlIAFILZGVzY3JpcHRpb26IAQESIQoJaW1hZ2VQYXRoGAYgASgJSAFSCWltYWdlUGF0aIgB'
    'AUIOCgxfZGVzY3JpcHRpb25CDAoKX2ltYWdlUGF0aA==');
