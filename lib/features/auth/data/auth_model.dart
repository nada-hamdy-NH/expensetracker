import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_model.freezed.dart';
@freezed 
abstract class AuthModel with _$AuthModel{
  const factory AuthModel({
    required String email,
    required String password,
    required String username
  }) = _AuthModel; 
}