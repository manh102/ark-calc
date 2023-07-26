part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AppState {}

class AppBottomBarState extends AppState {
  final bool isShowBottomBar;

  AppBottomBarState({required this.isShowBottomBar});

  @override
  List<Object> get props => [isShowBottomBar];
}
