import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/di.dart';
import '../../domain/usecases/login_usecase.dart';

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

  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    String username = _usernameController.text;
    String password = _passwordController.text;

    bool success = await _loginUseCase.execute(username, password);

    setState(() => _isLoading = false);

    if (success) {
      GoRouter.of(context).replace('/$username');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("نام کاربری یا رمز عبور اشتباه است.")),
      );
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
                      onPressed: _login,
                      child: const Text("ورود"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
