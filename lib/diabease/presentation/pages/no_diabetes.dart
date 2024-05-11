import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDiabetes extends StatelessWidget {
  const NoDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004aad),
        leading: const SizedBox(),
      ),
      backgroundColor: const Color(0xFF004aad),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/clear.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(
              'NO DIABETES',
              style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                  fontSize: 40.6,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Text(
              '**Notice : Although model predicted no diabetes Regular blood sugar tests recommended',
              style: GoogleFonts.leagueSpartan(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}
