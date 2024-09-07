import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app_updates_2024/bloc/change_theme/change_theme_bloc.dart';
import 'package:news_app_updates_2024/config/routes/route_name.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';
import 'package:news_app_updates_2024/utils/extension/localization_extension.dart';
import 'package:news_app_updates_2024/utils/image_string.dart';

import '../config/colors.dart';
import '../config/components/listtiles_widget.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageString.newsPaperStringImage,
                  width: 60,
                  height: 60,
                ),
                10.height,
                Text(context.localization!.newsPaper,
                    style: GoogleFonts.lobster(
                        textStyle: Theme.of(context).textTheme.bodyLarge)),
              ],
            ),
          ),
          // Todo Home ListTile
          ListTiles(
            icon: IconlyBold.home,
            text: context.localization!.home,
            fct: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteName.homeScreen);
            },
          ),
          // Todo Bookmark ListTile
          ListTiles(
            icon: IconlyBold.bookmark,
            text: context.localization!.bookmark,
            fct: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteName.bookMarkScreen);
            },
          ),
          10.height,
          const Divider(
            thickness: 5,
          ),
          // Todo Theme Change
          BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
              builder: (context, state) {
            return SwitchListTile(
                activeColor: lightIconsColor,
                value: state.isThemeChange,
                title: state.isThemeChange
                    ? Text(
                        context.localization!.dark,
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    : Text(
                        context.localization!.light,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                secondary: Icon(
                  state.isThemeChange ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onChanged: (value) {
                  context
                      .read<ChangeThemeBloc>()
                      .add(ChangeThemeToggleEvent(value));
                });
          })
        ],
      ),
    );
  }
}
