import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeIdleEvent extends HomeEvent {}

class GetBrandEvent extends HomeEvent {
  const GetBrandEvent();
}

class GetCategoriesEvent extends HomeEvent {}


class HomeInitialEvent extends HomeEvent {
  final bool isLoggedIn;

  const HomeInitialEvent({
    required this.isLoggedIn,
  });

  @override
  List<Object?> get props => [isLoggedIn];
}