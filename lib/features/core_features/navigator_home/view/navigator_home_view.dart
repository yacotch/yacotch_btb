import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/core_features/navigator_home/functions.dart';
import 'package:trainee_restaurantapp/features/core_features/navigator_home/widgets/bottom_navigation_bar.dart';
import '../../../../../core/ui/widgets/route_aware_widget.dart';

class NavigatorScreen extends StatefulWidget {
  static const String routeName = "NavigatorScreen/";
  final int homeType;

  const NavigatorScreen({Key? key, required this.homeType}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends RouteAwareState<NavigatorScreen> {
  late List<Widget> _pages;

  late PageController _pageController;
  int _selectedPage = 0;
  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  bool inScreen = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pages = NavigatorHomeFunctions.getPages(widget.homeType);
  }

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedPage = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _selectedPage = value;
                });
              },
              children: _pages,
            ),
          ),
          HomeBottomNavigationBar(
            (index) => _onItemTapped(index),
            _selectedPage,
            widget.homeType,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void onEnterScreen() {}

  @override
  void onLeaveScreen() {
    setState(() {
      inScreen = false;
    });
  }
}
