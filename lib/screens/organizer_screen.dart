import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFF5265FF);
const text = Color(0xFF09101D);

TextStyle sourceSans(double size, FontWeight weight, Color color) {
  return GoogleFonts.sourceSans3(
    fontSize: size,
    fontWeight: weight,
    color: color,
  );
}

// Макет 4 (сложный): профиль организатора
class OrganizerScreen extends StatelessWidget {
  const OrganizerScreen({super.key});

  // Один столбец статистики: число и подпись
  Widget stat(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: sourceSans(26, FontWeight.w600, text)),
          const SizedBox(height: 4),
          Text(label, style: sourceSans(16, FontWeight.w400, text)),
        ],
      ),
    );
  }

  // Вкладка About / Events / Reviews
  Widget chip(String label, bool active) {
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
          label,
          style: sourceSans(
            18,
            FontWeight.w600,
            active ? Colors.white : primary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const line = Divider(height: 1, thickness: 1, color: Color(0xFFE8EAF0));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 68, 24, 24),
        children: [
          // Заголовок
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(Icons.arrow_back, size: 24, color: primary),
              ),
              const SizedBox(width: 20),
              Text('Organizer', style: sourceSans(26, FontWeight.w600, text)),
              const Spacer(),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.more_vert, size: 24, color: primary),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Аватар и имя
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/organizer.png'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Albert Flores',
              style: sourceSans(26, FontWeight.w600, text),
            ),
          ),
          const SizedBox(height: 20),
          // Статистика
          SizedBox(
            height: 67,
            child: Row(
              children: [
                stat('2.368', 'Followers'),
                const VerticalDivider(width: 16, color: Color(0xFFE8EAF0)),
                stat('346', 'Following'),
                const VerticalDivider(width: 16, color: Color(0xFFE8EAF0)),
                stat('13', 'Events'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          line,
          const SizedBox(height: 24),
          // Кнопки Follow и Messages
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add_alt_1, size: 16),
                  label: Text(
                    'Follow',
                    style: sourceSans(16, FontWeight.w600, Colors.white),
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
                  label: Text(
                    'Messages',
                    style: sourceSans(16, FontWeight.w600, primary),
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
          line,
          const SizedBox(height: 24),
          // Вкладки
          Row(
            children: [
              chip('About', true),
              const SizedBox(width: 8),
              chip('Events', false),
              const SizedBox(width: 8),
              chip('Reviews', false),
            ],
          ),
          const SizedBox(height: 24),
          // Описание
          Text(
            'About',
            style: sourceSans(20, FontWeight.w600, const Color(0xFF2C3A4B)),
          ),
          const SizedBox(height: 4),
          Text.rich(
            TextSpan(
              style: sourceSans(
                16,
                FontWeight.w400,
                const Color(0xFF394452),
              ).copyWith(height: 1.5),
              children: [
                const TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                      'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad '
                      'minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem '
                      'ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor '
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
