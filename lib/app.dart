import 'package:bid_express/ui/pages/splash/ui/splash_page.dart';
import 'package:flutter/material.dart';

class BidExpressApp extends StatelessWidget {
  const BidExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BidExpress app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
