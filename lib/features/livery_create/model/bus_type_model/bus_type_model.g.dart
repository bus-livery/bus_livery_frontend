// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusTypeModel _$BusTypeModelFromJson(Map<String, dynamic> json) =>
    _BusTypeModel(
      busType: json['bus_type'] as String?,
      busModels: (json['bus_models'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BusTypeModelToJson(_BusTypeModel instance) =>
    <String, dynamic>{
      'bus_type': instance.busType,
      'bus_models': instance.busModels,
    };
