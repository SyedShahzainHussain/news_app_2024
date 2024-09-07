import 'package:equatable/equatable.dart';
import 'package:news_app_updates_2024/utils/enums.dart';

class SwitchNewsState extends Equatable {
  final NewsType newsType;

  const SwitchNewsState({this.newsType = NewsType.allNews});

  SwitchNewsState copyWith({NewsType? newsType}) {
    return SwitchNewsState(newsType: newsType ?? this.newsType);
  }

  @override
  List<Object?> get props => [newsType];
}
