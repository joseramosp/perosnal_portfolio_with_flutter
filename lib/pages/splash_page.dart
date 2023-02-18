import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/helpers/colors.dart';
import 'package:personal_portfolio/helpers/personal_portfolio_icons_icons.dart';
import 'package:personal_portfolio/pages/portfoliomain_page.dart';
import 'package:personal_portfolio/pages/welcome_page.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../services/welcome_page_service.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer delayTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  void fetchData(BuildContext context) {
    var delayTimer = Timer(const Duration(seconds: 2), () async {
      var isWelcomePageDataRetrieved =
          await context.read<WelcomePageService>().retrieveWelcomePageData();
      if (isWelcomePageDataRetrieved) {
        GoRouter.of(Utils.mainNav.currentContext!).go(WelcomePage.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: Center(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
              width: 60,
              height: 60,
              child: Stack(
                children: const [
                  Center(
                      child: Icon(Icons.account_circle,
                          color: Colors.white, size: 50)),
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(width: 20),
          const Text('Loading an awesome,\nKick-ass Profile...',
              style: TextStyle(color: Colors.white)),
        ])));
  }

  @override
  void dispose() {
    delayTimer.cancel();
    super.dispose();
  }
}
