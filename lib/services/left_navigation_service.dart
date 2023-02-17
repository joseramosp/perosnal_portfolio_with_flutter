import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/utils.dart';
import '../models/left_navigation_item.dart';

class LeftNavigationService extends ChangeNotifier {
  LeftNavigationService() {
    navItems.first.isSelected = true;
  }

  List<LeftNavigationItem> navItems = Utils.getDefaultNavItems();

  void selectNavItem(LeftNavigationItem item) {
    for (var element in navItems) {
      element.isSelected = item == element;
    }

    GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    notifyListeners();
  }
}
