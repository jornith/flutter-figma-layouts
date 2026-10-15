import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/food_menu_screen.dart';
import 'screens/organizer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Макеты из Figma',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/food': (context) => const FoodMenuScreen(),
        '/organizer': (context) => const OrganizerScreen(),
      },
    );
  }
}

// Главный экран: список кнопок для перехода к макетам
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Макеты из Figma')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Простые макеты', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/welcome'),
              child: const Text('1. Welcome'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/tasks'),
              child: const Text('2. Задачи (Home)'),
            ),
            const SizedBox(height: 24),
            const Text('Сложные макеты', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/food'),
              child: const Text('3. Popular Menu'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/organizer'),
              child: const Text('4. Organizer'),
            ),
          ],
        ),
      ),
    );
  }
}
