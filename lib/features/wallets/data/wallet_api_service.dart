import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WalletApiService {
  final  SupabaseClient _client;
  const WalletApiService(this._client);

  Future<void> createWallet({
    required WalletModel walletModel,
})async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw AuthException('User not authenticated');
    }

     return await _client.from('wallets').insert(
      { ...walletModel.toInsertJson()  ,
      'user_id': user.id,
      });
}


Future<List<Map<String, dynamic>>> getWallets() async {
  final user = _client.auth.currentUser;
  if (user == null) {
    throw AuthException('User not authenticated');
  }

  final response = await _client
      .from('wallets')
      .select()
      .eq('user_id', user.id);

 

  
  return response ; 
}
}