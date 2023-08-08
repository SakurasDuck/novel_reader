
import 'package:fixnum/fixnum.dart';
import 'package:json_annotation/json_annotation.dart';

/// A converter that can convert between a [Int64] and a [List<int>].
class Int64Converter implements JsonConverter<Int64, List<int>> {
  const Int64Converter();

  @override
  Int64 fromJson(List<int> json) => Int64.fromBytes(json);

  @override
  List<int> toJson(Int64 object) => object.toBytes();
}
