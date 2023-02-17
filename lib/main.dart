import 'package:flutter/material.dart';
import 'package:personal_portfolio/pages/splash_page.dart';
import 'package:personal_portfolio/routes/app_routes.dart';
import 'package:personal_portfolio/services/left_navigation_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LeftNavigationService(),
    ),
  ], child: const PortfolioApp()));
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio App',
      theme: ThemeData(
        fontFamily: 'Product Sans',
      ),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
