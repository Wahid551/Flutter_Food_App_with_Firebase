import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'auth/signIn.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
    ChangeNotifierProvider<ProductProvider>(
    create: (context) => ProductProvider(),),
    ChangeNotifierProvider<UserProvider>(
    create: (context) => UserProvider(),),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ),
        home: SignIn(),
      ),
    );
  }
}
