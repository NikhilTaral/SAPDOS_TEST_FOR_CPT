
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeDesktop extends StatelessWidget {
  const WelcomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 203, 208, 227),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/index.png'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Card(
                color: Colors.white,
                elevation: 30,
                shadowColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'SOPDAS',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 19, 35, 90),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Login to your sapdos account or create one now.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color.fromARGB(255, 19, 35, 90),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          context.go('/login');
                        }, //Enter
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 19, 35, 90),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 72, vertical: 12),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ElevatedButton(
                        onPressed: () {
                          context.go('/registerPage');
                        }, //Register
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 12),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(
                                color: Color.fromARGB(255, 19, 35, 90)),
                          ),
                        ),
                        child: const Text(
                          'SIGN-IN',
                          style:
                              TextStyle(color: Color.fromARGB(255, 19, 35, 90)),
                        ),
                      ),
                      const SizedBox(height: 30),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
