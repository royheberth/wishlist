import 'package:flutter/material.dart';

class NavigationMenuProvider with ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  PageController get pageController => _pageController;

  int get currentPage => _currentPage;

  set currentPage(int page) {
    _currentPage = page;
    _pageController.animateToPage(
      page,
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 350),
    );
    notifyListeners();
  }
}
