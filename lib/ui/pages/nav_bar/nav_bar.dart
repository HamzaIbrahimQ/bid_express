import 'package:bid_express/ui/pages/home/bloc/home_bloc.dart';
import 'package:bid_express/ui/pages/home/ui/home_page.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/manage_cars_page.dart';
import 'package:bid_express/ui/pages/nav_bar/widgets/bottom_nav_bar.dart';
import 'package:bid_express/ui/pages/notifications/ui/notifications_page.dart';
import 'package:bid_express/ui/pages/orders/bloc/orders_bloc.dart';
import 'package:bid_express/ui/pages/profile/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatefulWidget {
  final int? initialIndex;

  const NavBar({super.key, this.initialIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != null) {
      _selectedIndex = widget.initialIndex!;
    }
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => OrdersBloc(),
      child: const HomePage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) =>
        ManageCarsBloc()
          ..add(GetCars())),
      ],
      child: const ManageCarsPage(),
    ),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => _onItemSelected(index),
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
