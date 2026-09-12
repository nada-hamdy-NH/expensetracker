import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileApiService {
  final SupabaseClient _client;

  ProfileApiService(this._client);

  Future<void> updateProfile({
    required String currency,
    required String language,
  }) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw AuthException('User not authenticated');
    }

    final updates = {
      'preferred_currency': currency,
      'language': language,
       'onboarding_completed': true,
      'updated_at': DateTime.now().toIso8601String(),
    };

     await _client
        .from('profiles')
        .update(updates)
        .eq('id', user.id);
        
   
    
  }

  Future<PostgrestList> getOnboardingStatus() async {
    final user = _client.auth.currentUser;
   if (user == null) throw AuthException('User not authenticated');

    
    return await _client
        .from('profiles')
        .select('onboarding_completed')
        .eq('id', user.id);
  }


}