part of 'change_language_bloc.dart';

abstract class ChangeLanguageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeLanguage extends ChangeLanguageEvent {
  final LanguageChange languageChange;
  ChangeLanguage(this.languageChange);
}

class GetLanguageEvent extends ChangeLanguageEvent {}
