import 'package:e_commerce/common/components/custome_text_field.dart';
import 'package:e_commerce/common/components/space_height.dart';
import 'package:e_commerce/common/constants/colors.dart';
import 'package:e_commerce/data/models/requests/login_request_model.dart';
import 'package:e_commerce/presentation/auth/bloc/login/login_bloc.dart';
import 'package:e_commerce/presentation/auth/register_page.dart';
import 'package:e_commerce/presentation/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/button_style.dart';
import '../../common/constants/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(80.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130.0),
            child: Image.asset(
              Images.logo,
              width: 100,
              height: 100,
            ),
          ),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              "Hijab Store",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorName.dark,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              "Masuk untuk melanjutkan",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: ColorName.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomeTextField(
            controller: emailController,
            label: 'Username',
          ),
          const SpaceHeight(40.0),
          CustomeTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login Berhasil'),
                      backgroundColor: ColorName.green,
                    ),
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('gagal login'),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return Button.filled(
                  onPressed: () {
                    final data = LoginRequestModel(
                      identifier: emailController.text,
                      password: passwordController.text,
                    );
                    context.read<LoginBloc>().add(LoginEvent.login(data));
                  },
                  label: "Masuk");
            },
          ),
          const SpaceHeight(122.0),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: "Belum punya akun ? ",
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                        color: ColorName.primary,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
