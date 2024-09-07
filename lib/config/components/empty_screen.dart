import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String text, imagePath;

  const EmptyScreen({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(imagePath),
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ))
          ],
        ));
  }
}
