import 'package:flutter/material.dart';
import 'package:sopdas/Modules/Login/presintaton/page/login_page.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/page/signin_page.dart';

class WelcomeMobile extends StatelessWidget {
  const WelcomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 203, 208, 227),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/index.png'),
            const SizedBox(height: 20),
            const Text(
              'SOPDAS',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 19, 35, 90),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Login to your sapdos account or create one now.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromARGB(255, 19, 35, 90),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              }, //Enter
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 19, 35, 90),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: const Text(
                'SIGN-UP',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              }, //Register
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: Color.fromARGB(255, 19, 35, 90)),
                ),
              ),
              child: const Text(
                'SIGN-IN',
                style: TextStyle(color: Color.fromARGB(255, 19, 35, 90)),
              ),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {}, //do not init

              label: const Text(
                "Press as a Guest",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
