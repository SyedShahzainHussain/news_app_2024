import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constant.dart';
import '../../utils/storage/storage_utils.dart';

part 'change_theme_event.dart';
part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc() : super(const ChangeThemeState(isThemeChange: false)) {
    on<ChangeThemeToggleEvent>(_changeThemeEvent);
    on<FetchThemeEvent>(_fetchTheme);
  }
  _changeThemeEvent(
      ChangeThemeToggleEvent event, Emitter<ChangeThemeState> emit) async {
    await StorageUtils()
        .setValue(Constant.changeTheme, event.isThemeChange.toString());

    emit(state.copyWith(isThemeChange: event.isThemeChange));
  }

  _fetchTheme(FetchThemeEvent event, Emitter<ChangeThemeState> emit) async {
    final isChangedData = await StorageUtils().readValue(Constant.changeTheme);
    if (isChangedData == "" ||
        isChangedData == null ||
        isChangedData == "null") {
      emit(state.copyWith(isThemeChange: false));
    } else {
      emit(state.copyWith(
          isThemeChange: isChangedData == "false" ? false : true));
    }
  }
}
