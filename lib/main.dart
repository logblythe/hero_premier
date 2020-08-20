import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/provider_setup.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Premier Hero',
        theme: ThemeData(
          fontFamily: "Levenim MT",
          primaryColor: Color(0xFF37003D),
          accentColor: Color(0xFF541BB7),
          cardColor: Color(0xFFF8F4FF),
          backgroundColor: Color(0xFFF9FAFB),
          hintColor: Color(0xFF9EA6C9),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) => Router.generateRoute(settings),
        home: LoginScreen(),
      ),
    );
  }
}
