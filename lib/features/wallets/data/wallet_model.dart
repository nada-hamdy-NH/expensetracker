import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';

@freezed
abstract class WalletModel with _$WalletModel {
  const WalletModel._();

  const factory WalletModel({
    String? id,
    required String name,
    required double balance,
    required String currency,
    String? icon,
    int? color,
    required bool isDefault,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      icon: json['icon'] as String?,
      color: json['color'] as int?,
      isDefault: json['is_default'] as bool,
    );
  }

  Map<String, dynamic> toInsertJson() {
    return {
      'name': name,
      'balance': balance,
      'currency': currency,
      'icon': icon,
      'color': color,
      'is_default': isDefault,
    };
  }
}
