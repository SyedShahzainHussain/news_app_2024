import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_event.dart';
import 'package:news_app_updates_2024/bloc/switch_news_type/switch_news_state.dart';

class SwitchNewsBloc extends Bloc<SwitchNewsEvent, SwitchNewsState> {
  SwitchNewsBloc() : super(const SwitchNewsState()) {
    on<SwitchNewsTypeEvent>(_switchNewstype);
  }

  _switchNewstype(
      SwitchNewsTypeEvent event, Emitter<SwitchNewsState> emit) async {
    emit(state.copyWith(newsType: event.newsType));
  }
}
