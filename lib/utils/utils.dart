import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app_updates_2024/utils/enums.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';

class Utils {
  static Locale getLocale(LanguageChange languageChange) {
    switch (languageChange) {
      case LanguageChange.English:
        return const Locale('en');
      case LanguageChange.Spanish:
        return const Locale('es');
      case LanguageChange.Urdu:
        return const Locale('ur');
      default:
        return const Locale('en'); // Default to English
    }
  }

  static alertDialog(BuildContext context, String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                ),
                10.width,
                const Text("An Error Occured"),
              ],
            ),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Okay",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).iconTheme.color,
                      ),
                ),
              )
            ],
          );
        });
  }
}
