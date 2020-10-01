// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NavigationStateTearOff {
  const _$NavigationStateTearOff();

// ignore: unused_element
  _NavigationState call(
      {@required bool isHomeScreen,
      @required bool isWeatherScreen,
      @required int index}) {
    return _NavigationState(
      isHomeScreen: isHomeScreen,
      isWeatherScreen: isWeatherScreen,
      index: index,
    );
  }
}

// ignore: unused_element
const $NavigationState = _$NavigationStateTearOff();

mixin _$NavigationState {
  bool get isHomeScreen;
  bool get isWeatherScreen;
  int get index;

  $NavigationStateCopyWith<NavigationState> get copyWith;
}

abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
  $Res call({bool isHomeScreen, bool isWeatherScreen, int index});
}

class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;

  @override
  $Res call({
    Object isHomeScreen = freezed,
    Object isWeatherScreen = freezed,
    Object index = freezed,
  }) {
    return _then(_value.copyWith(
      isHomeScreen:
          isHomeScreen == freezed ? _value.isHomeScreen : isHomeScreen as bool,
      isWeatherScreen: isWeatherScreen == freezed
          ? _value.isWeatherScreen
          : isWeatherScreen as bool,
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

abstract class _$NavigationStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigationStateCopyWith(
          _NavigationState value, $Res Function(_NavigationState) then) =
      __$NavigationStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isHomeScreen, bool isWeatherScreen, int index});
}

class __$NavigationStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements _$NavigationStateCopyWith<$Res> {
  __$NavigationStateCopyWithImpl(
      _NavigationState _value, $Res Function(_NavigationState) _then)
      : super(_value, (v) => _then(v as _NavigationState));

  @override
  _NavigationState get _value => super._value as _NavigationState;

  @override
  $Res call({
    Object isHomeScreen = freezed,
    Object isWeatherScreen = freezed,
    Object index = freezed,
  }) {
    return _then(_NavigationState(
      isHomeScreen:
          isHomeScreen == freezed ? _value.isHomeScreen : isHomeScreen as bool,
      isWeatherScreen: isWeatherScreen == freezed
          ? _value.isWeatherScreen
          : isWeatherScreen as bool,
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

class _$_NavigationState implements _NavigationState {
  const _$_NavigationState(
      {@required this.isHomeScreen,
      @required this.isWeatherScreen,
      @required this.index})
      : assert(isHomeScreen != null),
        assert(isWeatherScreen != null),
        assert(index != null);

  @override
  final bool isHomeScreen;
  @override
  final bool isWeatherScreen;
  @override
  final int index;

  @override
  String toString() {
    return 'NavigationState(isHomeScreen: $isHomeScreen, isWeatherScreen: $isWeatherScreen, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NavigationState &&
            (identical(other.isHomeScreen, isHomeScreen) ||
                const DeepCollectionEquality()
                    .equals(other.isHomeScreen, isHomeScreen)) &&
            (identical(other.isWeatherScreen, isWeatherScreen) ||
                const DeepCollectionEquality()
                    .equals(other.isWeatherScreen, isWeatherScreen)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isHomeScreen) ^
      const DeepCollectionEquality().hash(isWeatherScreen) ^
      const DeepCollectionEquality().hash(index);

  @override
  _$NavigationStateCopyWith<_NavigationState> get copyWith =>
      __$NavigationStateCopyWithImpl<_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {@required bool isHomeScreen,
      @required bool isWeatherScreen,
      @required int index}) = _$_NavigationState;

  @override
  bool get isHomeScreen;
  @override
  bool get isWeatherScreen;
  @override
  int get index;
  @override
  _$NavigationStateCopyWith<_NavigationState> get copyWith;
}
