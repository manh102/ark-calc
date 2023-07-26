import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(Empty()) {
    on<ScrollEvent>(_onScroll);
  }

  void _onScroll(ScrollEvent event, Emitter<AppState> emit) {
    if (event.isShowBottomBar) {
      emit(AppBottomBarState(isShowBottomBar: true));
    } else {
      emit(AppBottomBarState(isShowBottomBar: false));
    }
  }
}
