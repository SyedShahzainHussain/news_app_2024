import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';

class BlogPageScreen extends StatelessWidget {
  const BlogPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconlyLight.arrow_left_2)),
          iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text("Title",
              style: GoogleFonts.lobster(
                  textStyle: Theme.of(context).textTheme.headlineMedium)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Crypto and crypto compamens - TexhCrunch",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              25.height,

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("20/20/2023",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("readingTimeText",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: context.mediaQueryHeight * 0.33,
                    child: FancyShimmerImage(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCcZgzHS5HS02nxVXYM-ZV7LxuHqbUNdCj8A&s",
                      boxFit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              25.height,
              // Todo Descriptions
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.height,
                    Text(
                      "Description " * 10,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              // Todo Contents
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contents",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.height,
                    Text(
                      "Contents " * 10,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
