part of 'change_language_bloc.dart';

class ChangeLanguageState extends Equatable {
  final LanguageChange languageChange;

  const ChangeLanguageState({this.languageChange = LanguageChange.English});

  ChangeLanguageState copyWith({LanguageChange? languageChange}) {
    return ChangeLanguageState(
        languageChange: languageChange ?? this.languageChange);
  }

  @override
  List<Object?> get props => [languageChange];
}
