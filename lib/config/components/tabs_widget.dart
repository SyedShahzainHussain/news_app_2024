import 'package:flutter/material.dart';
import 'package:news_app_updates_2024/utils/extension/localization_extension.dart';

import '../../bloc/switch_news_type/switch_news_bloc.dart';
import '../../bloc/switch_news_type/switch_news_event.dart';
import '../../bloc/switch_news_type/switch_news_state.dart';
import '../../config/components/tab_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updates_2024/utils/enums.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchNewsBloc, SwitchNewsState>(
      builder: (context, state) {
        return Row(
          children: [
            TabsWidget(
              text: context.localization!.allnews,
              color: state.newsType == NewsType.allNews
                  ? Theme.of(context).cardColor
                  : Colors.transparent,
              onTap: () {
                if (state.newsType == NewsType.allNews) {
                  return;
                }
                context
                    .read<SwitchNewsBloc>()
                    .add(SwitchNewsTypeEvent(NewsType.allNews));
              },
              textStyle: state.newsType == NewsType.allNews
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context).textTheme.bodySmall,
            ),
            25.width,
            TabsWidget(
              text: context.localization!.toptrending,
              color: state.newsType == NewsType.topTrending
                  ? Theme.of(context).cardColor
                  : Colors.transparent,
              onTap: () {
                if (state.newsType == NewsType.topTrending) {
                  return;
                }
                context
                    .read<SwitchNewsBloc>()
                    .add(SwitchNewsTypeEvent(NewsType.topTrending));
              },
              textStyle: state.newsType == NewsType.topTrending
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}
