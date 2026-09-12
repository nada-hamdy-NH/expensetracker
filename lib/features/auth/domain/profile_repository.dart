import 'package:expensetracker/core/utils/result.dart';

abstract class ProfileRepository {
  Future<Result<void>> updateProfile({
    required String currency,
    required String language,
  });

  Future<Result<bool>> getOnboardingStatus();
}