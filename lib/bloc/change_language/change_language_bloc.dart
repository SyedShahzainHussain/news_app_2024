import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constant.dart';
import '../../utils/enums.dart';
import '../../utils/storage/storage_utils.dart';

part 'change_language_event.dart';
part 'change_language_state.dart';

class ChangeLanguageBloc
    extends Bloc<ChangeLanguageEvent, ChangeLanguageState> {
  ChangeLanguageBloc() : super(const ChangeLanguageState()) {
    on<ChangeLanguage>(_changeLanguage);
    on<GetLanguageEvent>(_getLanguageEvent);
  }

  _changeLanguage(
      ChangeLanguage event, Emitter<ChangeLanguageState> emit) async {
    emit(state.copyWith(languageChange: event.languageChange));

    await StorageUtils()
        .setValue(Constant.changeLanguage, event.languageChange.toString());
  }

  _getLanguageEvent(
      GetLanguageEvent event, Emitter<ChangeLanguageState> emit) async {
    final currentLanguage =
        await StorageUtils().readValue(Constant.changeLanguage);
    LanguageChange languageChange = LanguageChange.English; // Default language

    if (currentLanguage != null) {
      // Convert stored string back to enum
      languageChange = LanguageChange.values.firstWhere(
        (e) => e.toString() == currentLanguage,
        orElse: () => LanguageChange.English, // Default if not found
      );
    }
    emit(state.copyWith(languageChange: languageChange));
  }
}
