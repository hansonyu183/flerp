// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ebas _$EbasFromJson(Map<String, dynamic> json) {
  return Ebas()
    ..ebas = (json['ebas'] as List<Eba>)
        ?.map((dynamic e) => e == null ? null : Eba.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EbasToJson(Ebas instance) => <String, dynamic>{
      'ebas': instance.ebas?.map((Eba e) => e?.toJson())?.toList(),
    };
