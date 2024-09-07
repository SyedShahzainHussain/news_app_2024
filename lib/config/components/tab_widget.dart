
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({
    super.key,
    required this.color,
    required this.text,
    this.textStyle,
    required this.onTap,
  });
  final Color color;
  final String text;
  final TextStyle? textStyle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        child: Text(text,
            style: GoogleFonts.poppins(
              textStyle: textStyle,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
