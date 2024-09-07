part of 'change_theme_bloc.dart';

class ChangeThemeState extends Equatable {
  final bool isThemeChange;

  const ChangeThemeState({required this.isThemeChange});

  ChangeThemeState copyWith({bool? isThemeChange}) {
    return ChangeThemeState(isThemeChange: isThemeChange ?? this.isThemeChange);
  }

  @override
  List<Object?> get props => [isThemeChange];
}
