import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/asset_paths.dart';
import '../models/bottom_navbar_item.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarState.initial());

  void changeIndex(int index) {
    List<BottomNavbarItem> items = state.items;
    items.firstWhere((item) => item.isSelected).isSelected = false;
    items[index].isSelected = true;
    emit(state.copyWith(items));
  }
}
