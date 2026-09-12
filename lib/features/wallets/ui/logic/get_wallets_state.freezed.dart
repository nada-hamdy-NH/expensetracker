// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_wallets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetWalletsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWalletsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetWalletsState()';
}


}

/// @nodoc
class $GetWalletsStateCopyWith<$Res>  {
$GetWalletsStateCopyWith(GetWalletsState _, $Res Function(GetWalletsState) __);
}


/// Adds pattern-matching-related methods to [GetWalletsState].
extension GetWalletsStatePatterns on GetWalletsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetWalletsInitial value)?  initial,TResult Function( GetWalletsLoading value)?  loading,TResult Function( GetWalletsSuccess value)?  success,TResult Function( GetWalletsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetWalletsInitial() when initial != null:
return initial(_that);case GetWalletsLoading() when loading != null:
return loading(_that);case GetWalletsSuccess() when success != null:
return success(_that);case GetWalletsFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetWalletsInitial value)  initial,required TResult Function( GetWalletsLoading value)  loading,required TResult Function( GetWalletsSuccess value)  success,required TResult Function( GetWalletsFailure value)  failure,}){
final _that = this;
switch (_that) {
case GetWalletsInitial():
return initial(_that);case GetWalletsLoading():
return loading(_that);case GetWalletsSuccess():
return success(_that);case GetWalletsFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetWalletsInitial value)?  initial,TResult? Function( GetWalletsLoading value)?  loading,TResult? Function( GetWalletsSuccess value)?  success,TResult? Function( GetWalletsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case GetWalletsInitial() when initial != null:
return initial(_that);case GetWalletsLoading() when loading != null:
return loading(_that);case GetWalletsSuccess() when success != null:
return success(_that);case GetWalletsFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<WalletModel> wallets)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetWalletsInitial() when initial != null:
return initial();case GetWalletsLoading() when loading != null:
return loading();case GetWalletsSuccess() when success != null:
return success(_that.wallets);case GetWalletsFailure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<WalletModel> wallets)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case GetWalletsInitial():
return initial();case GetWalletsLoading():
return loading();case GetWalletsSuccess():
return success(_that.wallets);case GetWalletsFailure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<WalletModel> wallets)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case GetWalletsInitial() when initial != null:
return initial();case GetWalletsLoading() when loading != null:
return loading();case GetWalletsSuccess() when success != null:
return success(_that.wallets);case GetWalletsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class GetWalletsInitial implements GetWalletsState {
  const GetWalletsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWalletsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetWalletsState.initial()';
}


}




/// @nodoc


class GetWalletsLoading implements GetWalletsState {
  const GetWalletsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWalletsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetWalletsState.loading()';
}


}




/// @nodoc


class GetWalletsSuccess implements GetWalletsState {
  const GetWalletsSuccess(final  List<WalletModel> wallets): _wallets = wallets;
  

 final  List<WalletModel> _wallets;
 List<WalletModel> get wallets {
  if (_wallets is EqualUnmodifiableListView) return _wallets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wallets);
}


/// Create a copy of GetWalletsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetWalletsSuccessCopyWith<GetWalletsSuccess> get copyWith => _$GetWalletsSuccessCopyWithImpl<GetWalletsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWalletsSuccess&&const DeepCollectionEquality().equals(other._wallets, _wallets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_wallets));

@override
String toString() {
  return 'GetWalletsState.success(wallets: $wallets)';
}


}

/// @nodoc
abstract mixin class $GetWalletsSuccessCopyWith<$Res> implements $GetWalletsStateCopyWith<$Res> {
  factory $GetWalletsSuccessCopyWith(GetWalletsSuccess value, $Res Function(GetWalletsSuccess) _then) = _$GetWalletsSuccessCopyWithImpl;
@useResult
$Res call({
 List<WalletModel> wallets
});




}
/// @nodoc
class _$GetWalletsSuccessCopyWithImpl<$Res>
    implements $GetWalletsSuccessCopyWith<$Res> {
  _$GetWalletsSuccessCopyWithImpl(this._self, this._then);

  final GetWalletsSuccess _self;
  final $Res Function(GetWalletsSuccess) _then;

/// Create a copy of GetWalletsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wallets = null,}) {
  return _then(GetWalletsSuccess(
null == wallets ? _self._wallets : wallets // ignore: cast_nullable_to_non_nullable
as List<WalletModel>,
  ));
}


}

/// @nodoc


class GetWalletsFailure implements GetWalletsState {
  const GetWalletsFailure(this.message);
  

 final  String message;

/// Create a copy of GetWalletsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetWalletsFailureCopyWith<GetWalletsFailure> get copyWith => _$GetWalletsFailureCopyWithImpl<GetWalletsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWalletsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GetWalletsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $GetWalletsFailureCopyWith<$Res> implements $GetWalletsStateCopyWith<$Res> {
  factory $GetWalletsFailureCopyWith(GetWalletsFailure value, $Res Function(GetWalletsFailure) _then) = _$GetWalletsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GetWalletsFailureCopyWithImpl<$Res>
    implements $GetWalletsFailureCopyWith<$Res> {
  _$GetWalletsFailureCopyWithImpl(this._self, this._then);

  final GetWalletsFailure _self;
  final $Res Function(GetWalletsFailure) _then;

/// Create a copy of GetWalletsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GetWalletsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
