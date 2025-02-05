import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../config/app_router.dart';
import '../../domain/usecases/login_usecase.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();


  void _login() async {
    bool success = await _loginUseCase.execute(
      _usernameController.text,
      _passwordController.text,
    );

    if (success) {
      print("ورود موفق!");
      context.router.replace(DashboardRoute());
    } else {
      print("نام کاربری یا رمز عبور اشتباه است.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ورود به حساب")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "نام کاربری"),
                validator: (value) =>
                    value!.isEmpty ? "لطفاً نام کاربری را وارد کنید" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "رمز عبور"),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? "لطفاً رمز عبور را وارد کنید" : null,
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => _login(),
                      child: const Text("ورود"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
