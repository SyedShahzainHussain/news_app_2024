import 'package:equatable/equatable.dart';
import 'package:news_app_updates_2024/utils/enums.dart';

abstract class SwitchNewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SwitchNewsTypeEvent extends SwitchNewsEvent {
  final NewsType newsType;
  SwitchNewsTypeEvent(this.newsType);
}
