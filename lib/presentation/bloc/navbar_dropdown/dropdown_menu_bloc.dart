import "package:bloc/bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart";
import "package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_state.dart";

class DropdownMenuBloc extends Bloc<DropdownMenuEvent, DropdownMenuState> {
  DropdownMenuBloc() : super(MenuHiddenState()) {
    on<ShowExpertisesMenuEvent>((event, emit) {
      emit(ExpertisesMenuShowedState());
    });
    on<ShowOffersMenuEvent>((event, emit) {
      emit(OffersMenuShowedState());
    });
    on<ShowAboutUsMenuEvent>((event, emit) {
      emit(AboutUsMenuShowedState());
    });
    on<HideMenuEvent>((event, emit) {
      emit(MenuHiddenState());
    });
    on<ShowSearchNavbarEvent>((event, emit) {
      emit(SearchNavbarShowedState());
    });
  }
}
