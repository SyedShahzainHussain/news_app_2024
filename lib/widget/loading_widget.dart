import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_state.dart';
import 'package:news_app_updates_2024/utils/enums.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchNewsBloc, SwitchNewsState>(
      builder: (context, state) {
        return state.newsType == NewsType.allNews
            ? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const ArticleLoadingWidget();
                  },
                  itemCount: 10,
                ),
              )
            : SizedBox(
                height: context.mediaQueryHeight * 0.6,
                child: const TopTrendingLoadingWidget());
      },
    );
  }
}

class TopTrendingLoadingWidget extends StatelessWidget {
  const TopTrendingLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
        autoplay: true,
        autoplayDelay: 8000,
        layout: SwiperLayout.STACK,
        viewportFraction: 0.9,
        itemWidth: context.mediaQueryWidth * 0.9,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {},
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.shade400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.red,
                          height: context.mediaQueryHeight * 0.33,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: context.mediaQueryHeight * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red,
                          ),
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const ClipOval(
                              child: SizedBox(
                                // color: Colors.red,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 20,
                              width: context.mediaQueryWidth * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ArticleLoadingWidget extends StatelessWidget {
  const ArticleLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Theme.of(context).cardColor,
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade400,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: context.mediaQueryHeight * 0.16,
                        width: context.mediaQueryHeight * 0.16,
                        color: Colors.red,
                      ),
                    ),
                    10.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: context.mediaQueryHeight * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          10.height,
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: context.mediaQueryHeight * 0.025,
                              width: context.mediaQueryWidth * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          10.height,
                          FittedBox(
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: context.mediaQueryHeight * 0.025,
                                  width: context.mediaQueryWidth * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
