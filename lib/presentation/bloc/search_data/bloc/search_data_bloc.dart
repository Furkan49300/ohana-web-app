import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/search_data/search_data_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/search_data/search_data_state.dart';

class SearchDataBloc extends Bloc<SearchDataEvent, SearchDataState> {
  SearchDataBloc() : super(SearchDataInitialState()) {
    on<SearchDataEvent>((event, emit) {});
  }
}
