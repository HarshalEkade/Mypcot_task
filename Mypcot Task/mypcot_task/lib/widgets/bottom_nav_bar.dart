import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../constants/colors.dart';
import '../screens/dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _screens() => const [
        DashboardScreen(),
        Scaffold(),
        Scaffold(),
        Scaffold(),
        Scaffold(),
      ];

  List<PersistentBottomNavBarItem> _navItems(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.05;
    final centerButtonSize = screenWidth * 0.14;
    
    return [
      _normalNavItem("assets/icons/Group 910.svg", "Home", iconSize),
      _normalNavItem("assets/icons/Group 912.svg", "Customers", iconSize),
      PersistentBottomNavBarItem(
        icon: Container(
          width: centerButtonSize,
          height: centerButtonSize,
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: centerButtonSize * 0.5,
          ),
        ),
        title: null,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      _normalNavItem("assets/icons/Group 913.svg", "Khata", iconSize),
      _normalNavItem("assets/icons/Group 914.svg", "Orders", iconSize),
    ];
  }

  PersistentBottomNavBarItem _normalNavItem(String asset, String title, double iconSize) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        asset,
        height: iconSize,
        width: iconSize,
        colorFilter: const ColorFilter.mode(
          AppColors.darkBlue,
          BlendMode.srcIn,
        ),
      ),
      inactiveIcon: SvgPicture.asset(
        asset,
        height: iconSize,
        width: iconSize,
        colorFilter: ColorFilter.mode(
          AppColors.darkBlue.withOpacity(0.4),
          BlendMode.srcIn,
        ),
      ),
      title: title,
      activeColorPrimary: AppColors.darkBlue,
      inactiveColorPrimary: AppColors.darkBlue.withOpacity(0.4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens(),
      items: _navItems(context),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: screenHeight * 0.08,
      backgroundColor: Colors.white,

      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white, // removes dark corners
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 14,
            offset: const Offset(0, -6),
          ),
        ],
      ),

      resizeToAvoidBottomInset: true,
    );
  }
}
