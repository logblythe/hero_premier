import 'package:flutter/material.dart';
import 'package:hero_premier/core/helpers/secured_storage_helper.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/view_models/login_view_model.dart';
import 'package:hero_premier/provider_setup.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  const MyApp({Key key, this.loggedIn}) : super(key: key);

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
        home: IntermediaryScreen(),
      ),
    );
  }
}

class IntermediaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        navigationService: Provider.of(context),
        userService: Provider.of(context),
      ),
      onModelReady: (model) {
        init(model, context);
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AssetPaths.LOGO_WHITE)],
            ),
          ),
        );
      },
    );
  }

  void init(LoginViewModel model, BuildContext context) async {
    Map<String, dynamic> _stored = await model.storedCredentials();
    if (_stored[KEY_EMAIL] != null) {
      Navigator.of(context).pushReplacementNamed(RoutePaths.HOME);
      model.login(_stored[KEY_EMAIL], _stored[KEY_PASSWORD]);
    } else if (_stored[KEY_FB_TOKEN] != null) {
      Navigator.of(context).pushReplacementNamed(RoutePaths.HOME);
      model.fbLogin(_stored[KEY_FB_TOKEN]);
    } else {
      Navigator.of(context).pushReplacementNamed(RoutePaths.LOGIN);
    }
  }
}
