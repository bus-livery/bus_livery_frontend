// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusTypeModelImpl _$$BusTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$BusTypeModelImpl(
      busType: json['bus_type'] as String?,
      busModels:
          (json['bus_models'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$BusTypeModelImplToJson(_$BusTypeModelImpl instance) =>
    <String, dynamic>{
      'bus_type': instance.busType,
      'bus_models': instance.busModels,
    };
