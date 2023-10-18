import 'package:bid_express/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const BidExpressApp());
}