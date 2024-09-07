import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updates_2024/bloc/change_pagination_index/bloc/change_pagination_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_state.dart';
import 'package:news_app_updates_2024/utils/enums.dart';
import '../config/components/pagination_button.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchNewsBloc, SwitchNewsState>(
      builder: (context, state) {
        return state.newsType == NewsType.topTrending
            ? const SizedBox()
            : BlocBuilder<ChangePaginationBloc, ChangePaginationState>(
                builder: (context, changePaginationState) {
                  return SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PaginationButton(
                          title: "Prev",
                          onTap: () {
                            if (changePaginationState.currentIndex <= 0) {
                              return;
                            } else {
                              context.read<ChangePaginationBloc>().add(
                                  ChangePaginationIndex(
                                      changePaginationState.currentIndex - 1));
                            }
                          },
                        ),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<ChangePaginationBloc>()
                                            .add(ChangePaginationIndex(index));
                                      },
                                      child: Container(
                                        color: changePaginationState
                                                    .currentIndex ==
                                                index
                                            ? Colors.blue
                                            : Theme.of(context).cardColor,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text("${index + 1}"),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            )),
                        PaginationButton(
                          title: "Next",
                          onTap: () {
                            if (changePaginationState.currentIndex == 9) {
                              return;
                            } else {
                              context.read<ChangePaginationBloc>().add(
                                  ChangePaginationIndex(
                                      changePaginationState.currentIndex + 1));
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
