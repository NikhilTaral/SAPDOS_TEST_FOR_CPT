import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sopdas/Modules/welcome/presintaton/view/Mobile_view.dart';
import 'package:sopdas/Modules/welcome/presintaton/view/desktop_view.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ScreenTypeLayout.builder(
          mobile: (_) => const WelcomeMobile(),
          desktop: (_) => const WelcomeDesktop(),
        ),
      ),
    );
  }
}
