import 'package:flutter/material.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      home: const OnboardingScreen(),
    );
  }
}
