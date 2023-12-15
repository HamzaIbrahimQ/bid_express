import 'package:bid_express/ui/pages/nav_bar/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onItemSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: .08.sh,
      color: const Color(0xFFF5F5F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            title: 'Dashboard',
            icon: 'dashboard',
            isSelected: _isSelected(0),
            onTap: () => onItemSelected(0),
          ),
          NavBarItem(
            title: 'Manage cars',
            icon: 'manage_cars',
            isSelected: _isSelected(1),
            onTap: () => onItemSelected(1),
          ),
          NavBarItem(
            title: 'Notifications',
            icon: 'notifications',
            isSelected: _isSelected(2),
            onTap: () => onItemSelected(2),
          ),
          NavBarItem(
            title: 'Profile',
            icon: 'profile',
            isSelected: _isSelected(3),
            onTap: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }

  bool _isSelected(int index) {
    return selectedIndex == index;
  }
}
