import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app_updates_2024/bloc/change_drop_down/bloc/change_drop_down_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_state.dart';
import 'package:news_app_updates_2024/config/routes/routes.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';
import 'package:news_app_updates_2024/utils/extension/localization_extension.dart';
import 'package:news_app_updates_2024/widget/article_widget.dart';
import 'package:news_app_updates_2024/widget/pagination_widget.dart';
import 'package:news_app_updates_2024/widget/top_trending_widget.dart';

import '../config/components/change_language_widget.dart';
import '../config/components/tabs_widget.dart';
import '../utils/enums.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: Text(context.localization!.newsPaper,
            style: GoogleFonts.lobster(
                textStyle: Theme.of(context).textTheme.headlineMedium)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        actions: [
          Row(
            children: [
              const SizedBox(width: 80, child: LanguageChangeWidget()),
              IconButton(
                  icon: const Icon(IconlyLight.search),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.searchScreen);
                  }),
            ],
          )
        ],
      ),
      drawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Todo All News & Top Trending Tabs
            const Tabs(),
            15.height,
            // Todo Pagination Number & Button Widget
            const PaginationWidget(),
            15.height,
            // Todo Drop Down Button Widget
            BlocBuilder<ChangeDropDownBloc, ChangeDropDownState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<SortByEnum>(
                        value: state.dropDownValue,
                        items: SortByEnum.values
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name),
                                ))
                            .toList(),
                        onChanged: (value) {
                          context
                              .read<ChangeDropDownBloc>()
                              .add(ChangeDropDownValueEvent(value!));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            15.height,
            // Todo Article Widget
            BlocBuilder<SwitchNewsBloc, SwitchNewsState>(
              builder: (context, state) {
                return state.newsType == NewsType.allNews
                    ? const ArticleWidget()
                    : const TopTrendingWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}
