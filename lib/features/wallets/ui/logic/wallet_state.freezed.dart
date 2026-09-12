// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState()';
}


}

/// @nodoc
class $WalletStateCopyWith<$Res>  {
$WalletStateCopyWith(WalletState _, $Res Function(WalletState) __);
}


/// Adds pattern-matching-related methods to [WalletState].
extension WalletStatePatterns on WalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WalletInitial value)?  initial,TResult Function( WalletLoading value)?  loading,TResult Function( WalletSuccess value)?  success,TResult Function( WalletFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial(_that);case WalletLoading() when loading != null:
return loading(_that);case WalletSuccess() when success != null:
return success(_that);case WalletFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WalletInitial value)  initial,required TResult Function( WalletLoading value)  loading,required TResult Function( WalletSuccess value)  success,required TResult Function( WalletFailure value)  failure,}){
final _that = this;
switch (_that) {
case WalletInitial():
return initial(_that);case WalletLoading():
return loading(_that);case WalletSuccess():
return success(_that);case WalletFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WalletInitial value)?  initial,TResult? Function( WalletLoading value)?  loading,TResult? Function( WalletSuccess value)?  success,TResult? Function( WalletFailure value)?  failure,}){
final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial(_that);case WalletLoading() when loading != null:
return loading(_that);case WalletSuccess() when success != null:
return success(_that);case WalletFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial();case WalletLoading() when loading != null:
return loading();case WalletSuccess() when success != null:
return success();case WalletFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case WalletInitial():
return initial();case WalletLoading():
return loading();case WalletSuccess():
return success();case WalletFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case WalletInitial() when initial != null:
return initial();case WalletLoading() when loading != null:
return loading();case WalletSuccess() when success != null:
return success();case WalletFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WalletInitial implements WalletState {
  const WalletInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.initial()';
}


}




/// @nodoc


class WalletLoading implements WalletState {
  const WalletLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.loading()';
}


}




/// @nodoc


class WalletSuccess implements WalletState {
  const WalletSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletState.success()';
}


}




/// @nodoc


class WalletFailure implements WalletState {
  const WalletFailure(this.message);
  

 final  String message;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletFailureCopyWith<WalletFailure> get copyWith => _$WalletFailureCopyWithImpl<WalletFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WalletState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $WalletFailureCopyWith<$Res> implements $WalletStateCopyWith<$Res> {
  factory $WalletFailureCopyWith(WalletFailure value, $Res Function(WalletFailure) _then) = _$WalletFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WalletFailureCopyWithImpl<$Res>
    implements $WalletFailureCopyWith<$Res> {
  _$WalletFailureCopyWithImpl(this._self, this._then);

  final WalletFailure _self;
  final $Res Function(WalletFailure) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WalletFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
