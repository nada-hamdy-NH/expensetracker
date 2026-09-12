// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompleteProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteProfileState()';
}


}

/// @nodoc
class $CompleteProfileStateCopyWith<$Res>  {
$CompleteProfileStateCopyWith(CompleteProfileState _, $Res Function(CompleteProfileState) __);
}


/// Adds pattern-matching-related methods to [CompleteProfileState].
extension CompleteProfileStatePatterns on CompleteProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompleteProfileInitial value)?  initial,TResult Function( CompleteProfileLoading value)?  loading,TResult Function( CompleteProfileSuccess value)?  success,TResult Function( CompleteProfileFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompleteProfileInitial() when initial != null:
return initial(_that);case CompleteProfileLoading() when loading != null:
return loading(_that);case CompleteProfileSuccess() when success != null:
return success(_that);case CompleteProfileFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompleteProfileInitial value)  initial,required TResult Function( CompleteProfileLoading value)  loading,required TResult Function( CompleteProfileSuccess value)  success,required TResult Function( CompleteProfileFailure value)  failure,}){
final _that = this;
switch (_that) {
case CompleteProfileInitial():
return initial(_that);case CompleteProfileLoading():
return loading(_that);case CompleteProfileSuccess():
return success(_that);case CompleteProfileFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompleteProfileInitial value)?  initial,TResult? Function( CompleteProfileLoading value)?  loading,TResult? Function( CompleteProfileSuccess value)?  success,TResult? Function( CompleteProfileFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CompleteProfileInitial() when initial != null:
return initial(_that);case CompleteProfileLoading() when loading != null:
return loading(_that);case CompleteProfileSuccess() when success != null:
return success(_that);case CompleteProfileFailure() when failure != null:
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
case CompleteProfileInitial() when initial != null:
return initial();case CompleteProfileLoading() when loading != null:
return loading();case CompleteProfileSuccess() when success != null:
return success();case CompleteProfileFailure() when failure != null:
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
case CompleteProfileInitial():
return initial();case CompleteProfileLoading():
return loading();case CompleteProfileSuccess():
return success();case CompleteProfileFailure():
return failure(_that.message);}
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
case CompleteProfileInitial() when initial != null:
return initial();case CompleteProfileLoading() when loading != null:
return loading();case CompleteProfileSuccess() when success != null:
return success();case CompleteProfileFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CompleteProfileInitial implements CompleteProfileState {
  const CompleteProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteProfileState.initial()';
}


}




/// @nodoc


class CompleteProfileLoading implements CompleteProfileState {
  const CompleteProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteProfileState.loading()';
}


}




/// @nodoc


class CompleteProfileSuccess implements CompleteProfileState {
  const CompleteProfileSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteProfileState.success()';
}


}




/// @nodoc


class CompleteProfileFailure implements CompleteProfileState {
  const CompleteProfileFailure(this.message);
  

 final  String message;

/// Create a copy of CompleteProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteProfileFailureCopyWith<CompleteProfileFailure> get copyWith => _$CompleteProfileFailureCopyWithImpl<CompleteProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CompleteProfileState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CompleteProfileFailureCopyWith<$Res> implements $CompleteProfileStateCopyWith<$Res> {
  factory $CompleteProfileFailureCopyWith(CompleteProfileFailure value, $Res Function(CompleteProfileFailure) _then) = _$CompleteProfileFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CompleteProfileFailureCopyWithImpl<$Res>
    implements $CompleteProfileFailureCopyWith<$Res> {
  _$CompleteProfileFailureCopyWithImpl(this._self, this._then);

  final CompleteProfileFailure _self;
  final $Res Function(CompleteProfileFailure) _then;

/// Create a copy of CompleteProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CompleteProfileFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
