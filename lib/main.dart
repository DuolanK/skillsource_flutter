import 'package:flutter/material.dart';
import 'package:skillsourse/screens/dashboard_screen.dart';
import 'package:skillsourse/screens/home_screen.dart';
import 'package:skillsourse/auth/login.dart';
import 'package:skillsourse/auth/register.dart';
import 'package:skillsourse/api/get_data.dart';

void main() async {
  runApp(MyApp());
  await fetchData();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillsourseApp',
      initialRoute: '/myapp',
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/myapp': (context) => CharacterList(),
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
