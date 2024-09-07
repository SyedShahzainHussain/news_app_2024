import 'package:flutter/material.dart';
import 'package:news_app_updates_2024/screens/blog_page_screen.dart';
import 'package:news_app_updates_2024/screens/bookmark_screen.dart';
import 'package:news_app_updates_2024/screens/home_screen.dart';
import 'package:news_app_updates_2024/screens/news_details_web_view_screen.dart';
import 'package:news_app_updates_2024/screens/search_screen.dart';
import 'package:news_app_updates_2024/widget/loading_widget.dart';
import 'package:page_transition/page_transition.dart';

import 'routes.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.loadingScreen:
        return MaterialPageRoute(builder: (context) => const LoadingWidget());
      case RouteName.searchScreen:
        return PageTransition(
          child: const SearchScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case RouteName.bookMarkScreen:
        return PageTransition(
          child: const BookmarkScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case RouteName.newsDetailsWebViewScreen:
        return PageTransition(
          child: const NewsDetailsWebViewScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case RouteName.blogPageScreen:
        return PageTransition(
          child: const BlogPageScreen(),
          type: PageTransitionType.rightToLeft,
        );
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("No Routes Defined")),
          );
        });
    }
  }
}
