import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
<<<<<<< HEAD
import 'package:flutter_mvvm/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';
=======
>>>>>>> 2ff743bcc153ab8b7e9ce6166422f23c998624e9

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewmodel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
=======
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
>>>>>>> 2ff743bcc153ab8b7e9ce6166422f23c998624e9
    );
  }
}
