// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoreState _$CoreStateFromJson(Map<String, dynamic> json) {
  return _CoreState.fromJson(json);
}

/// @nodoc
mixin _$CoreState {
  ThemeMode? get themeMode => throw _privateConstructorUsedError;
  bool get gb => throw _privateConstructorUsedError;
  PageLayout get pageLayout => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  ItemScrollController? get itemScrollController =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  ItemPositionsListener? get itemPositionsListener =>
      throw _privateConstructorUsedError;
  List<int> get visiblePages => throw _privateConstructorUsedError;
  double get windowHeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoreStateCopyWith<CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<$Res> {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) then) =
      _$CoreStateCopyWithImpl<$Res, CoreState>;
  @useResult
  $Res call(
      {ThemeMode? themeMode,
      bool gb,
      PageLayout pageLayout,
      @JsonKey(ignore: true) ItemScrollController? itemScrollController,
      @JsonKey(ignore: true) ItemPositionsListener? itemPositionsListener,
      List<int> visiblePages,
      double windowHeight});
}

/// @nodoc
class _$CoreStateCopyWithImpl<$Res, $Val extends CoreState>
    implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = freezed,
    Object? gb = null,
    Object? pageLayout = null,
    Object? itemScrollController = freezed,
    Object? itemPositionsListener = freezed,
    Object? visiblePages = null,
    Object? windowHeight = null,
  }) {
    return _then(_value.copyWith(
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      gb: null == gb
          ? _value.gb
          : gb // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLayout: null == pageLayout
          ? _value.pageLayout
          : pageLayout // ignore: cast_nullable_to_non_nullable
              as PageLayout,
      itemScrollController: freezed == itemScrollController
          ? _value.itemScrollController
          : itemScrollController // ignore: cast_nullable_to_non_nullable
              as ItemScrollController?,
      itemPositionsListener: freezed == itemPositionsListener
          ? _value.itemPositionsListener
          : itemPositionsListener // ignore: cast_nullable_to_non_nullable
              as ItemPositionsListener?,
      visiblePages: null == visiblePages
          ? _value.visiblePages
          : visiblePages // ignore: cast_nullable_to_non_nullable
              as List<int>,
      windowHeight: null == windowHeight
          ? _value.windowHeight
          : windowHeight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoreStateCopyWith<$Res> implements $CoreStateCopyWith<$Res> {
  factory _$$_CoreStateCopyWith(
          _$_CoreState value, $Res Function(_$_CoreState) then) =
      __$$_CoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeMode? themeMode,
      bool gb,
      PageLayout pageLayout,
      @JsonKey(ignore: true) ItemScrollController? itemScrollController,
      @JsonKey(ignore: true) ItemPositionsListener? itemPositionsListener,
      List<int> visiblePages,
      double windowHeight});
}

/// @nodoc
class __$$_CoreStateCopyWithImpl<$Res>
    extends _$CoreStateCopyWithImpl<$Res, _$_CoreState>
    implements _$$_CoreStateCopyWith<$Res> {
  __$$_CoreStateCopyWithImpl(
      _$_CoreState _value, $Res Function(_$_CoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = freezed,
    Object? gb = null,
    Object? pageLayout = null,
    Object? itemScrollController = freezed,
    Object? itemPositionsListener = freezed,
    Object? visiblePages = null,
    Object? windowHeight = null,
  }) {
    return _then(_$_CoreState(
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      gb: null == gb
          ? _value.gb
          : gb // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLayout: null == pageLayout
          ? _value.pageLayout
          : pageLayout // ignore: cast_nullable_to_non_nullable
              as PageLayout,
      itemScrollController: freezed == itemScrollController
          ? _value.itemScrollController
          : itemScrollController // ignore: cast_nullable_to_non_nullable
              as ItemScrollController?,
      itemPositionsListener: freezed == itemPositionsListener
          ? _value.itemPositionsListener
          : itemPositionsListener // ignore: cast_nullable_to_non_nullable
              as ItemPositionsListener?,
      visiblePages: null == visiblePages
          ? _value._visiblePages
          : visiblePages // ignore: cast_nullable_to_non_nullable
              as List<int>,
      windowHeight: null == windowHeight
          ? _value.windowHeight
          : windowHeight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CoreState extends _CoreState {
  const _$_CoreState(
      {this.themeMode,
      this.gb = false,
      this.pageLayout = PageLayout.standard,
      @JsonKey(ignore: true) this.itemScrollController,
      @JsonKey(ignore: true) this.itemPositionsListener,
      final List<int> visiblePages = const [],
      this.windowHeight = 0})
      : _visiblePages = visiblePages,
        super._();

  factory _$_CoreState.fromJson(Map<String, dynamic> json) =>
      _$$_CoreStateFromJson(json);

  @override
  final ThemeMode? themeMode;
  @override
  @JsonKey()
  final bool gb;
  @override
  @JsonKey()
  final PageLayout pageLayout;
  @override
  @JsonKey(ignore: true)
  final ItemScrollController? itemScrollController;
  @override
  @JsonKey(ignore: true)
  final ItemPositionsListener? itemPositionsListener;
  final List<int> _visiblePages;
  @override
  @JsonKey()
  List<int> get visiblePages {
    if (_visiblePages is EqualUnmodifiableListView) return _visiblePages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visiblePages);
  }

  @override
  @JsonKey()
  final double windowHeight;

  @override
  String toString() {
    return 'CoreState(themeMode: $themeMode, gb: $gb, pageLayout: $pageLayout, itemScrollController: $itemScrollController, itemPositionsListener: $itemPositionsListener, visiblePages: $visiblePages, windowHeight: $windowHeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoreState &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.gb, gb) || other.gb == gb) &&
            (identical(other.pageLayout, pageLayout) ||
                other.pageLayout == pageLayout) &&
            (identical(other.itemScrollController, itemScrollController) ||
                other.itemScrollController == itemScrollController) &&
            (identical(other.itemPositionsListener, itemPositionsListener) ||
                other.itemPositionsListener == itemPositionsListener) &&
            const DeepCollectionEquality()
                .equals(other._visiblePages, _visiblePages) &&
            (identical(other.windowHeight, windowHeight) ||
                other.windowHeight == windowHeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      gb,
      pageLayout,
      itemScrollController,
      itemPositionsListener,
      const DeepCollectionEquality().hash(_visiblePages),
      windowHeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoreStateCopyWith<_$_CoreState> get copyWith =>
      __$$_CoreStateCopyWithImpl<_$_CoreState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoreStateToJson(
      this,
    );
  }
}

abstract class _CoreState extends CoreState {
  const factory _CoreState(
      {final ThemeMode? themeMode,
      final bool gb,
      final PageLayout pageLayout,
      @JsonKey(ignore: true) final ItemScrollController? itemScrollController,
      @JsonKey(ignore: true) final ItemPositionsListener? itemPositionsListener,
      final List<int> visiblePages,
      final double windowHeight}) = _$_CoreState;
  const _CoreState._() : super._();

  factory _CoreState.fromJson(Map<String, dynamic> json) =
      _$_CoreState.fromJson;

  @override
  ThemeMode? get themeMode;
  @override
  bool get gb;
  @override
  PageLayout get pageLayout;
  @override
  @JsonKey(ignore: true)
  ItemScrollController? get itemScrollController;
  @override
  @JsonKey(ignore: true)
  ItemPositionsListener? get itemPositionsListener;
  @override
  List<int> get visiblePages;
  @override
  double get windowHeight;
  @override
  @JsonKey(ignore: true)
  _$$_CoreStateCopyWith<_$_CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
