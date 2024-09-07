import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_updates_2024/config/components/empty_screen.dart';
import 'package:news_app_updates_2024/utils/extension/localization_extension.dart';
import 'package:news_app_updates_2024/utils/image_string.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          title: Text(context.localization!.bookmark,
              style: GoogleFonts.lobster(
                  textStyle: Theme.of(context).textTheme.headlineMedium)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        ),
        // body: const ArticleWidget(),
        body: const EmptyScreen(
          imagePath: ImageString.bookmarkStringImage,
          text: "You didn't add anything yet to your bookmarks",
        ));
  }
}
