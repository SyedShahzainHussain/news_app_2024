
import 'package:flutter/material.dart';

class PaginationButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const PaginationButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(6.0),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
    );
  }
}
