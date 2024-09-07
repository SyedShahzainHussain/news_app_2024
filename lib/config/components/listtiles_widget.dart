
import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final String text;
  final Function fct;
  final IconData icon;
  const ListTiles({
    super.key,
    required this.fct,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      onTap: () {
        fct();
      },
    );
  }
}
