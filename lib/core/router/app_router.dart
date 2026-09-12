import 'package:expensetracker/core/di/service_locator.dart';
import 'package:expensetracker/core/router/go_router_refresh_stream.dart';
import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:expensetracker/features/auth/domain/profile_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/complete_profile_cubit.dart';
import 'package:expensetracker/features/auth/ui/logic/login_cubit.dart';
import 'package:expensetracker/features/auth/ui/logic/sign_up_cubit.dart';
import 'package:expensetracker/features/auth/ui/view/login_view.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_cubit.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/ui/view/complete_profile_view.dart';
import '../../features/auth/ui/view/forgot_password_view.dart';

import '../../features/auth/ui/view/sign_up_view.dart';
import '../../features/auth/ui/view/splash_view.dart';
import '../../features/auth/ui/view/welcome_view.dart';
import '../../features/home/ui/view/home_view.dart';
import '../../features/transactions/ui/view/add_transaction_view.dart';
import '../../features/wallets/ui/view/add_wallet_view.dart';
import '../../features/wallets/ui/view/all_wallets_view.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  refreshListenable: GoRouterRefreshStream(
    getIt<AuthRepository>().authStateChanges,
  ),
  redirect: (context  , state) async {
final authRepository = getIt<AuthRepository>();
final loggedIn = authRepository.isLoggedIn;
final profileRepository = getIt<ProfileRepository>();
final onboardingCompleted = await profileRepository.getOnboardingStatus();
const authFlowRoutes = {

AppRoutes.welcome,
AppRoutes.login,
AppRoutes.signUp,
AppRoutes.forgotPassword,
};
final isSplash  = state.matchedLocation == AppRoutes.splash;
  final isAuthFlow = authFlowRoutes.contains(state.matchedLocation);

    if (!loggedIn) {
     
      return isAuthFlow ? null : AppRoutes.welcome;
    }

     if (isSplash || isAuthFlow ) { 
      if (onboardingCompleted is Success<bool> && onboardingCompleted.data) {
  return AppRoutes.home;
}else {
  return AppRoutes.completeProfile;
}
    

  

       }
    

    return null;
 
  },
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child:
      
      const LoginView(), 
    )),
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SignUpCubit>(),
        child:const SignUpView(),
    )),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: AppRoutes.completeProfile,
      builder: (context, state) =>
      BlocProvider(
        create: (context) => getIt<CompleteProfileCubit>(),
        child:
       const CompleteProfileView(),)
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<GetWalletsCubit>()..getWallets(),
        child:
  const HomeView(),
    )),
    GoRoute(
      path: AppRoutes.addTransaction,
      builder: (context, state) => const AddTransactionView(),
    ),
    GoRoute(
      path: AppRoutes.addWallet,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AddWalletCubit>(),
        child:
      
       const AddWalletView(),
    )),
    GoRoute(
      path: AppRoutes.allWallets,
    
      builder: (context, state) => const AllWalletsView(
        wallets: [],
      ),
    ),
  ],
);
