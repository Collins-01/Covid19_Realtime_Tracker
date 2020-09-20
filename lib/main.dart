import 'package:covid19_virus_tracker/Services/Api/api_client.dart';
import 'package:covid19_virus_tracker/Services/Notifiers/Api_Notifier.dart';
import 'package:covid19_virus_tracker/Views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  ApiClient().fetchCountryCases();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ApiNotifier())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.pink,
      title: 'Wear Of Covid19',
      // theme: AppTheme.lightTheme,

      home: SplashScreen(),
    );
  }
}
