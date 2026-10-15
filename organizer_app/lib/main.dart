import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFF5265FF);
const ink = Color(0xFF09101D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSans3TextTheme(),
        visualDensity: VisualDensity.standard,
      ),
      home: const OrganizerScreen(),
    );
  }
}

class OrganizerScreen extends StatelessWidget {
  const OrganizerScreen({super.key});

  // один столбец статистики
  Widget stat(String number, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: ink,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 16, color: ink)),
        ],
      ),
    );
  }

  // вкладка About / Events / Reviews
  Widget tab(String text, bool active) {
    return Expanded(
      child: Container(
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? primary : Colors.white,
          border: Border.all(color: primary, width: 2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : primary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 68, 24, 24),
        children: [
          // заголовок
          Row(
            children: [
              const Icon(Icons.arrow_back, color: primary),
              const SizedBox(width: 20),
              const Text(
                'Organizer',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: ink,
                ),
              ),
              const Spacer(),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.more_vert, color: primary),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // аватар и имя
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/organizer.png'),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Albert Flores',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: ink,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // статистика
          SizedBox(
            height: 67,
            child: Row(
              children: [
                stat('2.368', 'Followers'),
                const VerticalDivider(width: 16),
                stat('346', 'Following'),
                const VerticalDivider(width: 16),
                stat('13', 'Events'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1),
          const SizedBox(height: 24),
          // кнопки
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add_alt_1, size: 16),
                  label: const Text(
                    'Follow',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(0, 48),
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message, size: 16),
                  label: const Text(
                    'Messages',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    side: const BorderSide(color: primary, width: 2),
                    minimumSize: const Size(0, 48),
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(height: 1),
          const SizedBox(height: 24),
          // вкладки
          Row(
            children: [
              tab('About', true),
              const SizedBox(width: 8),
              tab('Events', false),
              const SizedBox(width: 8),
              tab('Reviews', false),
            ],
          ),
          const SizedBox(height: 24),
          // описание
          const Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3A4B),
            ),
          ),
          const SizedBox(height: 4),
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF394452),
              ),
              children: [
                TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna '
                      'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
                      'ullamco laboris nisi ut Lorem ipsum dolor sit amet, '
                      'consectetur adipiscing elit, sed do eiusmod tempor '
                      'incididunt ut labore et dolore magna aliqua. ',
                ),
                TextSpan(
                  text: 'Read more...',
                  style: TextStyle(color: primary, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
