import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const pink = Color(0xFFF43F5E);
const ink = Color(0xFF09101D);
const greyText = Color(0xFF858C94);

TextStyle sourceSans(double size, FontWeight weight, Color color) {
  return GoogleFonts.sourceSans3(
    fontSize: size,
    fontWeight: weight,
    color: color,
  );
}

// Макет 3 (сложный): список блюд Popular Menu
class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  // Данные блюд: картинка, название, ресторан, цена
  static const dishes = [
    ['food1', 'Original Salad', 'Lovy Food', '\$8'],
    ['food2', 'Fresh Salad', 'Cloudy Resto', '\$10'],
    ['food3', 'Yummie Ice Cream', 'Circlo Resto', '\$6'],
    ['food4', 'Vegan Special', 'Haty Food', '\$11'],
    ['food5', 'Mixed Pasta', 'Recto Food', '\$13'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 68, 24, 24),
        child: Column(
          children: [
            // Заголовок с кнопкой назад
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.maybePop(context),
                  child: Container(
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
                ),
                const SizedBox(width: 24),
                Text(
                  'Popular Menu',
                  style: sourceSans(26, FontWeight.w600, ink),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Поиск и фильтр
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
                    child: Row(
                      children: [
                        Text(
                          'Search',
                          style: sourceSans(14, FontWeight.w400, ink),
                        ),
                        const Spacer(),
                        const Icon(Icons.search, size: 24, color: greyText),
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
                  child: const Icon(Icons.tune, size: 24, color: pink),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Список блюд
            Expanded(
              child: ListView.separated(
                itemCount: dishes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 32),
                itemBuilder: (context, index) {
                  final dish = dishes[index];
                  return Container(
                    height: 88,
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
                          child: Image.asset(
                            'assets/images/${dish[0]}.png',
                            width: 64,
                            height: 64,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dish[1],
                              style: sourceSans(18, FontWeight.w600, ink),
                            ),
                            Text(
                              dish[2],
                              style: sourceSans(14, FontWeight.w400, greyText),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          dish[3],
                          style: sourceSans(29, FontWeight.w600, pink),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            // Нижнее меню
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
                    child: Row(
                      children: [
                        const Icon(Icons.home, size: 24, color: pink),
                        const SizedBox(width: 12),
                        Text(
                          'Home',
                          style: sourceSans(18, FontWeight.w600, pink),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.shopping_basket, size: 24, color: pink),
                  const Icon(Icons.chat, size: 24, color: pink),
                  const Icon(Icons.person, size: 24, color: pink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
