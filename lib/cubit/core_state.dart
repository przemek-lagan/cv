part of 'core_cubit.dart';

@freezed
class CoreState with _$CoreState {
  const CoreState._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CoreState({
    ThemeMode? themeMode,
    @Default(false) bool gb,
    @Default(PageLayout.standard) PageLayout pageLayout,
    @JsonKey(ignore: true) ItemScrollController? itemScrollController,
    @JsonKey(ignore: true) ItemPositionsListener? itemPositionsListener,
    @Default([]) List<int> visiblePages,
    @Default(0) double windowHeight,
  }) = _CoreState;

  factory CoreState.fromJson(Map<String, Object?> json) =>
      _$CoreStateFromJson(json);
}
