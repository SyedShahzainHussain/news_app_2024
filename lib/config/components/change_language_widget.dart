import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updates_2024/bloc/change_language/change_language_bloc.dart';

import '../../utils/enums.dart';

class LanguageChangeWidget extends StatelessWidget {
  const LanguageChangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageBloc, ChangeLanguageState>(
      builder: (context, state) {
        return PopupMenuButton<LanguageChange>(
          onSelected: (LanguageChange languageChange) {
            context
                .read<ChangeLanguageBloc>()
                .add(ChangeLanguage(languageChange));
          },
          initialValue: state.languageChange,
          tooltip: "Language Drop Down",
          itemBuilder: (BuildContext context) {
            return LanguageChange.values
                .map((e) => PopupMenuItem<LanguageChange>(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList();
          },
          icon: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_drop_down,
              ),
              Icon(Icons.language),
            ],
          ),
        );
      },
    );
  }
}
