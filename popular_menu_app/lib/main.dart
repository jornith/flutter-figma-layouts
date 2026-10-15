import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const pink = Color(0xFFF43F5E);
const ink = Color(0xFF09101D);
const greyText = Color(0xFF858C94);

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
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // карточка одного блюда
  Widget dishCard(String photo, String name, String place, String price) {
    return Container(
      height: 88,
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.fromLTRB(12, 12, 32, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x145A6CEA),
            blurRadius: 40,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(photo, width: 64, height: 64),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ink,
                ),
              ),
              Text(
                place,
                style: const TextStyle(fontSize: 14, color: greyText),
              ),
            ],
          ),
          const Spacer(),
          Text(
            price,
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w600,
              color: pink,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 68, 24, 24),
        child: Column(
          children: [
            // заголовок
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: pink.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: pink,
                  ),
                ),
                const SizedBox(width: 24),
                const Text(
                  'Popular Menu',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: ink,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // поиск и фильтр
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F6F9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(fontSize: 14, color: ink),
                        ),
                        Spacer(),
                        Icon(Icons.search, color: greyText),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: pink.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune, color: pink),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // список блюд
            Expanded(
              child: ListView(
                children: [
                  dishCard(
                    'assets/food1.png',
                    'Original Salad',
                    'Lovy Food',
                    '\$8',
                  ),
                  dishCard(
                    'assets/food2.png',
                    'Fresh Salad',
                    'Cloudy Resto',
                    '\$10',
                  ),
                  dishCard(
                    'assets/food3.png',
                    'Yummie Ice Cream',
                    'Circlo Resto',
                    '\$6',
                  ),
                  dishCard(
                    'assets/food4.png',
                    'Vegan Special',
                    'Haty Food',
                    '\$11',
                  ),
                  dishCard(
                    'assets/food5.png',
                    'Mixed Pasta',
                    'Recto Food',
                    '\$13',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // нижнее меню
            Container(
              height: 91,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x145A6CEA),
                    blurRadius: 40,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 43,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: pink.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.home, color: pink),
                        SizedBox(width: 12),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.shopping_basket, color: pink),
                  const Icon(Icons.chat, color: pink),
                  const Icon(Icons.person, color: pink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
