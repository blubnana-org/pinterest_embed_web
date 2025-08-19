import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.blueGrey, size: 64),
        const SizedBox(height: 12),
        Text(
          "Oh no...",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          "⚠️ Failed to load Pinterest board. \nPlease refresh the page.",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
