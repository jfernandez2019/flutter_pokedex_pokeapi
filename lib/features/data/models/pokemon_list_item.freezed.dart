// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PokemonListItem _$PokemonListItemFromJson(Map<String, dynamic> json) {
  return _PokemonListItem.fromJson(json);
}

/// @nodoc
mixin _$PokemonListItem {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListItemCopyWith<PokemonListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListItemCopyWith<$Res> {
  factory $PokemonListItemCopyWith(
    PokemonListItem value,
    $Res Function(PokemonListItem) then,
  ) = _$PokemonListItemCopyWithImpl<$Res, PokemonListItem>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonListItemCopyWithImpl<$Res, $Val extends PokemonListItem>
    implements $PokemonListItemCopyWith<$Res> {
  _$PokemonListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonListItemImplCopyWith<$Res>
    implements $PokemonListItemCopyWith<$Res> {
  factory _$$PokemonListItemImplCopyWith(
    _$PokemonListItemImpl value,
    $Res Function(_$PokemonListItemImpl) then,
  ) = __$$PokemonListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonListItemImplCopyWithImpl<$Res>
    extends _$PokemonListItemCopyWithImpl<$Res, _$PokemonListItemImpl>
    implements _$$PokemonListItemImplCopyWith<$Res> {
  __$$PokemonListItemImplCopyWithImpl(
    _$PokemonListItemImpl _value,
    $Res Function(_$PokemonListItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _$PokemonListItemImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListItemImpl implements _PokemonListItem {
  const _$PokemonListItemImpl({required this.name, required this.url});

  factory _$PokemonListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListItemImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonListItem(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListItemImplCopyWith<_$PokemonListItemImpl> get copyWith =>
      __$$PokemonListItemImplCopyWithImpl<_$PokemonListItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListItemImplToJson(this);
  }
}

abstract class _PokemonListItem implements PokemonListItem {
  const factory _PokemonListItem({
    required final String name,
    required final String url,
  }) = _$PokemonListItemImpl;

  factory _PokemonListItem.fromJson(Map<String, dynamic> json) =
      _$PokemonListItemImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListItemImplCopyWith<_$PokemonListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
