part of 'change_theme_bloc.dart';

abstract class ChangeThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeThemeToggleEvent extends ChangeThemeEvent {
  final bool isThemeChange;
  ChangeThemeToggleEvent(this.isThemeChange);
}

class FetchThemeEvent extends ChangeThemeEvent {}
