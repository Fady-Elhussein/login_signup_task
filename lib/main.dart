import 'package:flutter/material.dart';
import 'package:login_signup_task/providers/registeration_provider.dart';
import 'package:login_signup_task/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}