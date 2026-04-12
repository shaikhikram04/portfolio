import 'package:flutter/material.dart';
import 'package:ikram_portfolio/app/theme/app_theme.dart';
import 'package:ikram_portfolio/features/home/presentation/pages/home_page.dart';

class IkramPortfolio extends StatelessWidget {
  const IkramPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ikram Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
