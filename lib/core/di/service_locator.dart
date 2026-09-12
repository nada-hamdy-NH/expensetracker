import 'package:expensetracker/features/auth/data/auth_api_service.dart';
import 'package:expensetracker/features/auth/data/auth_repository_impl.dart';
import 'package:expensetracker/features/auth/data/profile_api%20_service.dart';
import 'package:expensetracker/features/auth/data/profile_repository_impl.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:expensetracker/features/auth/domain/profile_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/complete_profile_cubit.dart';
import 'package:expensetracker/features/auth/ui/logic/login_cubit.dart';
import 'package:expensetracker/features/auth/ui/logic/sign_up_cubit.dart';
import 'package:expensetracker/features/wallets/data/wallet_api_service.dart';
import 'package:expensetracker/features/wallets/data/wallet_repository.dart';
import 'package:expensetracker/features/wallets/domain/wallet_repository_imp.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_cubit.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt  = GetIt.instance;
void setupServiceLocator() {
 
    getIt.registerLazySingleton<SupabaseClient>(
  () => Supabase.instance.client,
);

  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(getIt()));
getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
getIt.registerFactory<LoginCubit>(
  () => LoginCubit(getIt()));
  getIt.registerFactory<SignUpCubit>(
  () => SignUpCubit(getIt()),
);



getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(getIt()));
getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(getIt()));
getIt.registerFactory<CompleteProfileCubit>(
  () => CompleteProfileCubit(getIt()));

getIt.registerLazySingleton<WalletApiService>(() => WalletApiService(getIt()));
getIt.registerLazySingleton<WalletRepository>(() => WalletRepositoryImp(getIt()));
getIt.registerFactory<AddWalletCubit>(() => AddWalletCubit(getIt()));
getIt.registerFactory<GetWalletsCubit>(() => GetWalletsCubit(getIt()));
}