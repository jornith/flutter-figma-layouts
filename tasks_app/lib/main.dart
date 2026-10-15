import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const dark = Color(0xFF000B23);
const grey = Color(0xFF7B7B7B);
const blue = Color(0xFF577CFF);
const orange = Color(0xFFFFB057);

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
        textTheme: GoogleFonts.workSansTextTheme(),
        visualDensity: VisualDensity.standard,
      ),
      home: const TasksScreen(),
    );
  }
}

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  // заголовок раздела со значками справа
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: dark,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                '18 Tasks Pending',
                style: TextStyle(fontSize: 12, color: grey),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.tune, color: dark),
          const SizedBox(width: 20),
          Container(width: 1, height: 37, color: Colors.black12),
          const SizedBox(width: 20),
          const Icon(Icons.add, color: dark),
        ],
      ),
    );
  }

  // цветной ярлык
  Widget tag(String text, Color color) {
    return Container(
      height: 26,
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  // карточка недельной задачи
  Widget weekCard(
    List<Widget> tags,
    String title,
    String photo1,
    String photo2,
    String count,
    String date,
  ) {
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
          Row(children: tags),
          const SizedBox(height: 18),
          SizedBox(
            width: 142,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: dark,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // три аватарки внахлёст
          SizedBox(
            width: 93,
            height: 37,
            child: Stack(
              children: [
                CircleAvatar(radius: 18.5, backgroundImage: AssetImage(photo1)),
                Positioned(
                  left: 28,
                  child: CircleAvatar(
                    radius: 18.5,
                    backgroundImage: AssetImage(photo2),
                  ),
                ),
                Positioned(
                  left: 56,
                  child: CircleAvatar(
                    radius: 18.5,
                    backgroundColor: orange,
                    child: Text(
                      count,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 22, color: dark),
              const SizedBox(width: 8),
              Text(date, style: const TextStyle(fontSize: 12, color: grey)),
            ],
          ),
        ],
      ),
    );
  }

  // карточка задачи на сегодня
  Widget taskCard(String title, String subtitle, bool done) {
    return Container(
      height: 152,
      margin: const EdgeInsets.fromLTRB(34, 0, 34, 20),
      padding: const EdgeInsets.fromLTRB(23, 23, 22, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: dark,
                        // у выполненной задачи текст зачёркнут
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12, color: grey),
                    ),
                  ],
                ),
              ),
              if (done)
                Container(
                  width: 37,
                  height: 37,
                  margin: const EdgeInsets.only(right: 9),
                  decoration: const BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
            ],
          ),
          const SizedBox(height: 19),
          const Divider(height: 1),
          const SizedBox(height: 17),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 22, color: dark),
              const SizedBox(width: 8),
              const Text(
                'Mon, 10 July 2022',
                style: TextStyle(fontSize: 12, color: grey),
              ),
              const Spacer(),
              SizedBox(
                width: 72,
                height: 29,
                child: Stack(
                  children: const [
                    CircleAvatar(
                      radius: 14.5,
                      backgroundImage: AssetImage('assets/av5.png'),
                    ),
                    Positioned(
                      left: 22,
                      child: CircleAvatar(
                        radius: 14.5,
                        backgroundImage: AssetImage('assets/av6.png'),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      child: CircleAvatar(
                        radius: 14.5,
                        backgroundColor: orange,
                        child: Text(
                          '1+',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.only(top: 64),
        children: [
          // шапка с именем
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22.5,
                  backgroundImage: AssetImage('assets/avatar_dan.png'),
                ),
                const SizedBox(width: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Good Evening!',
                      style: TextStyle(fontSize: 12, color: grey),
                    ),
                    Text(
                      'Dan Smith',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // кнопка поиска
                Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Icon(Icons.search, color: dark),
                ),
                const SizedBox(width: 10),
                // кнопка уведомлений
                Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Badge(
                    smallSize: 8,
                    backgroundColor: orange,
                    child: Icon(Icons.notifications_none, color: dark),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 38),
          sectionTitle('My Weekly Tasks'),
          const SizedBox(height: 25),
          // карточки листаются вбок
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 34),
              children: [
                weekCard(
                  [
                    tag('UI/UX Design', const Color(0xFF8E61E9)),
                    tag('High', const Color(0xFFE96161)),
                  ],
                  'Create a Landing Page',
                  'assets/av1.png',
                  'assets/av2.png',
                  '3+',
                  'Mon, 12 July 2022',
                ),
                weekCard(
                  [
                    tag('Development', const Color(0xFFEC8E00)),
                    tag('Low', const Color(0xFF1DC054)),
                  ],
                  'Develop a Website',
                  'assets/av3.png',
                  'assets/av4.png',
                  '2+',
                  'Mon, 30 July 2022',
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          sectionTitle('Today’s Tasks'),
          const SizedBox(height: 25),
          taskCard('Design 2 App Screens', 'Crypto Wallet App', true),
          taskCard('Design Homepage', 'Water Company Website', false),
        ],
      ),
      // нижнее меню
      bottomNavigationBar: SizedBox(
        height: 93,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: blue,
          unselectedItemColor: const Color(0xFFA8A8A8),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                smallSize: 8,
                backgroundColor: orange,
                child: Icon(Icons.chat_bubble_outline),
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined),
              label: 'Members',
            ),
          ],
        ),
      ),
    );
  }
}
