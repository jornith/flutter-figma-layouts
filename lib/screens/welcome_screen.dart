import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Макет 1 (простой): экран приветствия Welcome
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final white = GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    final black = GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF039EA2),
      body: Column(
        children: [
          const SizedBox(height: 149),
          Image.asset('assets/images/logo.png', width: 184),
          const SizedBox(height: 2),
          SizedBox(
            height: 42,
            child: Center(
              child: Text(
                'Meditate With Us!',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
          // Кнопка 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                minimumSize: const Size(double.infinity, 50),
                shape: const StadiumBorder(),
              ),
              child: Text('Sign in with Apple', style: black),
            ),
          ),
          const SizedBox(height: 12),
          // Кнопка 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCDFDFE),
                elevation: 0,
                minimumSize: const Size(double.infinity, 50),
                shape: const StadiumBorder(),
              ),
              child: Text('Continue with Email or Phone', style: black),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 34,
            child: TextButton(
              onPressed: () {},
              child: Text('Continue With Google', style: white),
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/yoga.png', width: 377),
          const SizedBox(height: 47),
        ],
      ),
    );
  }
}
