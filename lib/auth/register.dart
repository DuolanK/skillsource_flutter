import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordconfController = TextEditingController();

  Future<void> _register() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final passwordconf = _passwordconfController.text;

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/account/registration/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password1': password,
        'password2': passwordconf,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/login');
    }

    ///else if (response.statusCode == 200) {

    ///}

    else {
      final data = jsonDecode(response.body);
      final message = data['detail'];
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Registration Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordconfController,
                decoration:
                    const InputDecoration(labelText: 'Password confimation'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _register();
                  }
                },
                child: const Text('Register'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('I already have account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
