import 'package:equatable/equatable.dart';

abstract class DropdownMenuState extends Equatable {
  const DropdownMenuState();
  @override
  List<Object> get props => [];
}

class MenuHiddenState extends DropdownMenuState {}

class ExpertisesMenuShowedState extends DropdownMenuState {}

class OffersMenuShowedState extends DropdownMenuState {}

class AboutUsMenuShowedState extends DropdownMenuState {}
