import 'package:expensetracker/core/di/service_locator.dart';
import 'package:expensetracker/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/app_theme.dart';


void main() async {
   await Supabase.initialize(
    url: const String.fromEnvironment("SUPABASE_URL"),
    publishableKey: const String.fromEnvironment("SUPABASE_ANON_KEY"),
  );
  // ignore: avoid_print
  debugPrint('>>> DEBUG SUPABASE_URL = "${const String.fromEnvironment("SUPABASE_URL")}" <<<');
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    
      routerConfig: appRouter,
    );
  }
}
