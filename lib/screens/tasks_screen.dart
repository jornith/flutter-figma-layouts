import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const dark = Color(0xFF000B23);
const grey = Color(0xFF7B7B7B);
const blue = Color(0xFF577CFF);
const orange = Color(0xFFFFB057);

TextStyle workSans(double size, FontWeight weight, Color color) {
  return GoogleFonts.workSans(fontSize: size, fontWeight: weight, color: color);
}

// Макет 2 (простой): главный экран с задачами
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.only(top: 64),
        children: [
          // Шапка с приветствием
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22.5,
                  backgroundImage: AssetImage('assets/images/avatar_dan.png'),
                ),
                const SizedBox(width: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Evening!',
                      style: workSans(12, FontWeight.w400, grey),
                    ),
                    Text(
                      'Dan Smith',
                      style: workSans(20, FontWeight.w600, dark),
                    ),
                  ],
                ),
                const Spacer(),
                const RoundIcon(icon: Icons.search),
                const SizedBox(width: 10),
                const RoundIcon(icon: Icons.notifications_none, dot: true),
              ],
            ),
          ),
          const SizedBox(height: 38),
          const SectionHeader(title: 'My Weekly Tasks'),
          const SizedBox(height: 25),
          // Горизонтальный список карточек
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 34),
              children: const [
                WeeklyCard(
                  tags: [
                    Tag('UI/UX Design', Color(0xFF8E61E9), Color(0xFF8E61E9)),
                    Tag('High', Color(0xFFE96161), Color(0xFFE96161)),
                  ],
                  title: 'Create a Landing Page',
                  avatars: ['av1', 'av2'],
                  count: '3+',
                  date: 'Mon, 12 July 2022',
                ),
                WeeklyCard(
                  tags: [
                    Tag('Development', Color(0xFFFFA011), Color(0xFFEC8E00)),
                    Tag('Low', Color(0xFF61E98F), Color(0xFF1DC054)),
                  ],
                  title: 'Develop a Website',
                  avatars: ['av3', 'av4'],
                  count: '2+',
                  date: 'Mon, 30 July 2022',
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          const SectionHeader(title: 'Today’s Tasks'),
          const SizedBox(height: 25),
          const TaskCard(
            title: 'Design 2 App Screens',
            subtitle: 'Crypto Wallet App',
            done: true,
          ),
          const SizedBox(height: 20),
          const TaskCard(
            title: 'Design Homepage',
            subtitle: 'Water Company Website',
            done: false,
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

// Круглая кнопка с иконкой (поиск, уведомления)
class RoundIcon extends StatelessWidget {
  final IconData icon;
  final bool dot;

  const RoundIcon({super.key, required this.icon, this.dot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE3E3E3)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon, size: 24, color: dark),
          if (dot)
            Positioned(
              right: 13,
              top: 12,
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Заголовок раздела с кнопками фильтра и плюса
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: workSans(18, FontWeight.w600, dark)),
              const SizedBox(height: 3),
              Text(
                '18 Tasks Pending',
                style: workSans(12, FontWeight.w400, grey),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.tune, size: 24, color: dark),
          const SizedBox(width: 20),
          Container(width: 1, height: 37, color: const Color(0xFFDDDDDD)),
          const SizedBox(width: 20),
          const Icon(Icons.add, size: 24, color: dark),
        ],
      ),
    );
  }
}

class Tag {
  final String text;
  final Color background;
  final Color textColor;

  const Tag(this.text, this.background, this.textColor);
}

// Наложенные друг на друга аватарки
class AvatarStack extends StatelessWidget {
  final List<String> images;
  final String count;
  final double size;
  final double step;

  const AvatarStack({
    super.key,
    required this.images,
    required this.count,
    required this.size,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < images.length; i++) {
      items.add(
        Positioned(
          left: i * step,
          child: CircleAvatar(
            radius: size / 2,
            backgroundImage: AssetImage('assets/images/${images[i]}.png'),
          ),
        ),
      );
    }
    items.add(
      Positioned(
        left: images.length * step,
        child: CircleAvatar(
          radius: size / 2,
          backgroundColor: orange,
          child: Text(
            count,
            style: workSans(size > 30 ? 14 : 11, FontWeight.w600, Colors.white),
          ),
        ),
      ),
    );
    return SizedBox(
      width: (images.length + 1) * step + size - step,
      height: size,
      child: Stack(children: items),
    );
  }
}

class DateRow extends StatelessWidget {
  final String date;

  const DateRow({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, size: 22, color: dark),
        const SizedBox(width: 8),
        Text(date, style: workSans(12, FontWeight.w400, grey)),
      ],
    );
  }
}

// Карточка недельной задачи (горизонтальный список)
class WeeklyCard extends StatelessWidget {
  final List<Tag> tags;
  final String title;
  final List<String> avatars;
  final String count;
  final String date;

  const WeeklyCard({
    super.key,
    required this.tags,
    required this.title,
    required this.avatars,
    required this.count,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 203,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.fromLTRB(17, 19, 17, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (final tag in tags)
                Container(
                  height: 26,
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: tag.background.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    tag.text,
                    style: workSans(12, FontWeight.w500, tag.textColor),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: 142,
            child: Text(title, style: workSans(18, FontWeight.w600, dark)),
          ),
          const SizedBox(height: 12),
          AvatarStack(images: avatars, count: count, size: 37, step: 28),
          const SizedBox(height: 22),
          DateRow(date: date),
        ],
      ),
    );
  }
}

// Карточка задачи на сегодня
class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool done;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      margin: const EdgeInsets.symmetric(horizontal: 34),
      padding: const EdgeInsets.fromLTRB(23, 23, 22, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: workSans(18, FontWeight.w600, dark).copyWith(
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(subtitle, style: workSans(12, FontWeight.w400, grey)),
                  ],
                ),
              ),
              if (done)
                Container(
                  width: 37,
                  height: 37,
                  margin: const EdgeInsets.only(top: 3, right: 9),
                  decoration: const BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 22),
                ),
            ],
          ),
          const SizedBox(height: 19),
          Container(height: 1, color: const Color(0xFFE6E6E6)),
          const SizedBox(height: 17),
          Row(
            children: [
              const DateRow(date: 'Mon, 10 July 2022'),
              const Spacer(),
              const AvatarStack(
                images: ['av5', 'av6'],
                count: '1+',
                size: 29,
                step: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Нижнее меню
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  Widget item(IconData icon, String label, bool active, {bool dot = false}) {
    final color = active ? blue : const Color(0xFFA8A8A8);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon, size: 26, color: color),
            if (dot)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: const BoxDecoration(
                    color: orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(label, style: workSans(12, FontWeight.w500, color)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      padding: const EdgeInsets.only(top: 23),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 40,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          item(Icons.home_outlined, 'Home', true),
          item(Icons.assignment_outlined, 'Projects', false),
          item(Icons.calendar_today_outlined, 'Calendar', false),
          item(Icons.chat_bubble_outline, 'Messages', false, dot: true),
          item(Icons.group_outlined, 'Members', false),
        ],
      ),
    );
  }
}
