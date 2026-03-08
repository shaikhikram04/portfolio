import 'package:flutter/material.dart';
import 'homepage.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const IkramPortfolio());
}

class IkramPortfolio extends StatelessWidget {
  const IkramPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ikram Portfolio',
      debugShowCheckedModeBanner: false,
      // Apply the centralised dark theme
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}

