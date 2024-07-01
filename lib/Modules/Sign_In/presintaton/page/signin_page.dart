
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/Sign_In/data/models/singin_module.dart';
import 'package:sopdas/Modules/Sign_In/data/repositories/signin_repo.dart';
import 'package:sopdas/Modules/Sign_In/domin/usecases/signin_Usecase.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/bloc/signin_bloc.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/bloc/signin_state.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/bloc/signin_event.dart';
import 'package:sopdas/core/colors/colores.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String dropdownValue = 'select';
  final List<String> items = ['select', 'doctor', 'patient'];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargerScreen = screenWidth > 800;

    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(
          RegisterUseCase(AuthRepository()),
        ),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registration Successful')),
              );
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Registration Failed: ${state.error}')),
              );
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return Container(
                color: AppColors.light,
                child: Row(
                  children: [
                    if (isLargerScreen)
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Image.asset('assets/index.png'),
                        ),
                      ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: SizedBox(
                          width: screenWidth,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'SAPDOS',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.dark,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Enter new Account Details',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 60,
                                    width: 290,
                                    child: TextField(
                                      controller: _nameController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter Name",
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 60,
                                    width: 290,
                                    child: TextField(
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter Email",
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 60,
                                    width: 290,
                                    child: TextField(
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter Password",
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                      obscureText: true,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 60,
                                    width: 290,
                                    child: DropdownButtonFormField<String>(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.group,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                      items: items.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 60,
                                    width: 290,
                                    child: TextField(
                                      controller: _mobileNumberController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter Mobile Number",
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 60,
                                    width: 290,
                                    child: TextField(
                                      controller: _addressController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter Address",
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.home,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  if (state is RegisterLoading)
                                    const CircularProgressIndicator()
                                  else
                                    SizedBox(
                                      height: 60,
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
                                          final register = Register(
                                            id: 'unique_id',
                                            uId: 'unique_uid',
                                            createdOn: DateTime.now(),
                                            updatedOn: DateTime.now(),
                                            createdBy: 'admin',
                                            updatedBy: 'admin',
                                            archived: false,
                                            version: 1,
                                            active: true,
                                            dType: 'type',
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            mobileNumber:
                                                _mobileNumberController.text,
                                            address: _addressController.text,
                                            age: '25',
                                            specialization: 'specialization',
                                            documents: [],
                                            role: dropdownValue,
                                            description: 'description',
                                            experience: 5,
                                            password: _passwordController.text,
                                            disease: 'disease',
                                          );
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(
                                            RegisterSubmitted(register),
                                          );
                                        },
                                        child: const Text(
                                          'Register',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.light,
                                          ),
                                        ),
                                      ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
