import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/personal_portfolio_icons_icons.dart';

class TwitterPage extends StatelessWidget {
  static const String route = '/twitter';

  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(PersonalPortfolioIcons.twitter,
            size: 90, color: PersonalPortfolioColors.lightBlue),
        Text("Follow me",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 90,
                color: Colors.white)),
        Text("JoseRamos.dev",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white)),
      ],
    ));
  }
}
