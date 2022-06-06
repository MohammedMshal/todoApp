import 'package:flutter/material.dart';
import 'package:udimy_abdalla_mansour/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    defaultTextFormFiled(
                      controller: emailController,
                      validator: (value) {
                        return null;
                      },
                      keybordType: TextInputType.emailAddress,
                      prefixIco: Icons.email,
                      lable: 'Email Addres',
                    ),
                    const SizedBox(height: 15),
                    defaultTextFormFiled(
                      controller: passwordController,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                      keybordType: TextInputType.visiblePassword,
                      prefixIco: Icons.lock,
                      onPressedSuffix: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      lable: 'Password',
                    ),
                    const SizedBox(height: 20),
                    defaultButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          debugPrint(
                              '${emailController.text} \n ${passwordController.text}');
                        }
                      },
                    ),
                    Row(
                      children: [
                        const Text('Dont\'have an accout?'),
                        TextButton(
                            onPressed: () {}, child: const Text('Rgister Now'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
