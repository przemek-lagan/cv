// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoreState _$$_CoreStateFromJson(Map<String, dynamic> json) => _$_CoreState(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['theme_mode']),
      gb: json['gb'] as bool? ?? false,
      pageLayout:
          $enumDecodeNullable(_$PageLayoutEnumMap, json['page_layout']) ??
              PageLayout.standard,
      visiblePages: (json['visible_pages'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      windowHeight: (json['window_height'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_CoreStateToJson(_$_CoreState instance) =>
    <String, dynamic>{
      'theme_mode': _$ThemeModeEnumMap[instance.themeMode],
      'gb': instance.gb,
      'page_layout': _$PageLayoutEnumMap[instance.pageLayout]!,
      'visible_pages': instance.visiblePages,
      'window_height': instance.windowHeight,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$PageLayoutEnumMap = {
  PageLayout.tooSmall: 'tooSmall',
  PageLayout.narrow4: 'narrow4',
  PageLayout.narrow3: 'narrow3',
  PageLayout.narrow2: 'narrow2',
  PageLayout.narrow1: 'narrow1',
  PageLayout.standard: 'standard',
  PageLayout.wide1: 'wide1',
  PageLayout.wide2: 'wide2',
  PageLayout.wide3: 'wide3',
  PageLayout.wide4: 'wide4',
};
