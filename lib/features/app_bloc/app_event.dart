part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ScrollEvent extends AppEvent {
  final bool isShowBottomBar;

  ScrollEvent({
    required this.isShowBottomBar,
  });

  @override
  List<Object?> get props => [isShowBottomBar];
}
