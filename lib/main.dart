import 'package:flutter/material.dart';
import 'package:skillsource/screens/dashboard_screen.dart';
import 'package:skillsource/screens/home_screen.dart';
import 'package:skillsource/screens/onboarding_screen.dart';
import 'package:skillsource/themes/app_theme.dart';
import 'package:skillsource/auth/login.dart';
import 'package:skillsource/auth/register.dart';
import 'package:skillsource/api/get_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizApp',
      initialRoute: '/register',
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/homescreen': (context) => HomeScreen(),
        '/getdata': (context) => GetDataPage(),
      },
    );
  }
}

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RstflowApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/token');
              },
              child: const Text('Token'),
            ),
          ],
        ),
      ),
    );
  }
}
