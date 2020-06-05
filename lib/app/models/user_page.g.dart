// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPage _$UserPageFromJson(Map<String, dynamic> json) {
  return UserPage(
    name: _$enumDecodeNullable(_$PageEnumEnumMap, json['name']),
  );
}

Map<String, dynamic> _$UserPageToJson(UserPage instance) => <String, dynamic>{
      'name': _$PageEnumEnumMap[instance.name],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PageEnumEnumMap = {
  PageEnum.roleEditor: 'roleEditor',
  PageEnum.baseEbaEditor: 'baseEbaEditor',
  PageEnum.baseResEditor: 'baseResEditor',
  PageEnum.baseSupEditor: 'baseSupEditor',
  PageEnum.resIn: 'resIn',
  PageEnum.bankNoteVou: 'bankNoteVou',
  PageEnum.testPage1: 'testPage1',
};
