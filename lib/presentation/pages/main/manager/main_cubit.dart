import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  PageController mainPageController = PageController();

  MainCubit() : super(MainState(0));

  void changeNavBarIndex(int index) {
    emit(MainState(index));
  }
}
