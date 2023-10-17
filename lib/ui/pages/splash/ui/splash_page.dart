import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/imgs/bg.svg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 24),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset('assets/imgs/logo.svg')),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('CARPARTS'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
