import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HasDiabetes extends StatelessWidget {
  const HasDiabetes({super.key});

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
              'assets/images/diabetes.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(
              'DIABETES +',
              style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                  fontSize: 40.6,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              children: [
                Text(
                  "We strongly encourage you to consult with a healthcare professional. It's essential to take proactive steps to manage your health. We recommend",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.leagueSpartan(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  ' visiting a doctor and undergoing an FBS (Fasting Blood Sugar) test',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.leagueSpartan(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  " to confirm the diagnosis and receive appropriate medical advice and treatment.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.leagueSpartan(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
