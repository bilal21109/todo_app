import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/tab_model.dart';
import '../models/todo_model.dart';

part 'tab_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsState.initial());

  void changeIndex(int index) {
    List<TabModel> tabs = state.tabs;
    tabs.firstWhere((item) => item.isSelected).isSelected = false;
    tabs[index].isSelected = true;
    emit(state.copyWith(tabs: tabs));
  }
}
