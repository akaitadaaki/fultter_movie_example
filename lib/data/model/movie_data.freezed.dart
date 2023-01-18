// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MovieDataTearOff {
  const _$MovieDataTearOff();

  _MovieData call(
      {required String url, required bool autoPlay, required bool looping}) {
    return _MovieData(
      url: url,
      autoPlay: autoPlay,
      looping: looping,
    );
  }
}

/// @nodoc
const $MovieData = _$MovieDataTearOff();

/// @nodoc
mixin _$MovieData {
  String get url => throw _privateConstructorUsedError;
  bool get autoPlay => throw _privateConstructorUsedError;
  bool get looping => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDataCopyWith<MovieData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDataCopyWith<$Res> {
  factory $MovieDataCopyWith(MovieData value, $Res Function(MovieData) then) =
      _$MovieDataCopyWithImpl<$Res>;
  $Res call({String url, bool autoPlay, bool looping});
}

/// @nodoc
class _$MovieDataCopyWithImpl<$Res> implements $MovieDataCopyWith<$Res> {
  _$MovieDataCopyWithImpl(this._value, this._then);

  final MovieData _value;
  // ignore: unused_field
  final $Res Function(MovieData) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? autoPlay = freezed,
    Object? looping = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      looping: looping == freezed
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MovieDataCopyWith<$Res> implements $MovieDataCopyWith<$Res> {
  factory _$MovieDataCopyWith(
          _MovieData value, $Res Function(_MovieData) then) =
      __$MovieDataCopyWithImpl<$Res>;
  @override
  $Res call({String url, bool autoPlay, bool looping});
}

/// @nodoc
class __$MovieDataCopyWithImpl<$Res> extends _$MovieDataCopyWithImpl<$Res>
    implements _$MovieDataCopyWith<$Res> {
  __$MovieDataCopyWithImpl(_MovieData _value, $Res Function(_MovieData) _then)
      : super(_value, (v) => _then(v as _MovieData));

  @override
  _MovieData get _value => super._value as _MovieData;

  @override
  $Res call({
    Object? url = freezed,
    Object? autoPlay = freezed,
    Object? looping = freezed,
  }) {
    return _then(_MovieData(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      looping: looping == freezed
          ? _value.looping
          : looping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MovieData implements _MovieData {
  _$_MovieData(
      {required this.url, required this.autoPlay, required this.looping});

  @override
  final String url;
  @override
  final bool autoPlay;
  @override
  final bool looping;

  @override
  String toString() {
    return 'MovieData(url: $url, autoPlay: $autoPlay, looping: $looping)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieData &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.autoPlay, autoPlay) &&
            const DeepCollectionEquality().equals(other.looping, looping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(autoPlay),
      const DeepCollectionEquality().hash(looping));

  @JsonKey(ignore: true)
  @override
  _$MovieDataCopyWith<_MovieData> get copyWith =>
      __$MovieDataCopyWithImpl<_MovieData>(this, _$identity);
}

abstract class _MovieData implements MovieData {
  factory _MovieData(
      {required String url,
      required bool autoPlay,
      required bool looping}) = _$_MovieData;

  @override
  String get url;
  @override
  bool get autoPlay;
  @override
  bool get looping;
  @override
  @JsonKey(ignore: true)
  _$MovieDataCopyWith<_MovieData> get copyWith =>
      throw _privateConstructorUsedError;
}
