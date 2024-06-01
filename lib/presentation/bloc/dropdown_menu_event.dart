import 'package:equatable/equatable.dart';

abstract class DropdownMenuEvent extends Equatable {
  const DropdownMenuEvent();
  @override
  List<Object> get props => [];
}

class HideMenuEvent extends DropdownMenuEvent {}

class ShowExpertisesMenuEvent extends DropdownMenuEvent {}

class ShowOffersMenuEvent extends DropdownMenuEvent {}

class ShowAboutUsMenuEvent extends DropdownMenuEvent {}
