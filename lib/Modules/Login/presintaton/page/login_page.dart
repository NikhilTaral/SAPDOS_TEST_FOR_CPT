// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sopdas/Modules/Login/data/repositories/login_repo.dart';
import 'package:sopdas/Modules/Login/domin/usecases/login_usecase.dart';
import 'package:sopdas/Modules/Login/presintaton/bloc/login_bloc.dart';
import 'package:sopdas/Modules/Login/presintaton/bloc/login_event.dart';
import 'package:sopdas/Modules/Login/presintaton/bloc/login_state.dart';
import 'package:sopdas/core/colors/colores.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isLargeScreen = screenWidth > 800;

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(LoginUseCase(AuthRepository())),
        child: Container(
          color: const Color.fromARGB(255, 203, 208, 227),
          child: Row(
            children: [
              if (isLargeScreen)
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/index.png"),
                      ],
                    ),
                  ),
                ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: screenHeight,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 2),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                if (state is LoginFailure) {
                                  return Text(
                                    state.error,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "SAPDOS",
                              style: TextStyle(
                                fontSize: isLargeScreen ? 62 : 42,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: isLargeScreen ? 32 : 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Enter existing account's details",
                              style: TextStyle(
                                fontSize: isLargeScreen ? 22 : 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 60,
                              width: 290,
                              child: TextField(
                                controller: _userNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            StatefulBuilder(
                              builder: (context, setState) {
                                return SizedBox(
                                  height: 60,
                                  width: 290,
                                  child: TextField(
                                    controller: _passwordController,
                                    obscureText: obscurePassword,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            obscurePassword = !obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    const Text(
                                      'Remember me',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            BlocListener<LoginBloc, LoginState>(
                              listener: (context, state) async {
                                if (state is LoginSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Login Successful: ${state.response.role}'),
                                    ),
                                  );

                                  final name = state.response.uId;

                                  if (state.response.role == 'Doctor') {
                                    context
                                        .go('/doctor', extra: {'name': name});
                                  } else if (state.response.role == 'patient') {
                                    context
                                        .go('/patient', extra: {'name': name});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Unknown role: ${state.response.role}')),
                                    );
                                  }
                                } else if (state is LoginFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Login Failed: ${state.error}')),
                                  );
                                }
                              },
                              child: BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return SizedBox(
                                    height: 40,
                                    width: 290,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.dark,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        final userName =
                                            _userNameController.text;
                                        final password =
                                            _passwordController.text;
                                        BlocProvider.of<LoginBloc>(context).add(
                                          LoginSubmitted(userName, password),
                                        );
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.light,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Not on Sapdos?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.go('/registerPage');
                                  },
                                  child: const Text(
                                    'Sign-up',
                                    style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
