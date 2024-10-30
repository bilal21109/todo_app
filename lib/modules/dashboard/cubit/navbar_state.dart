part of 'navbar_cubit.dart';

class NavbarState {
  final List<BottomNavbarItem> items;
  NavbarState({required this.items});

  factory NavbarState.initial() {
    return NavbarState(
        items: [
      BottomNavbarItem(icon: AssetPaths.icHome, isSelected: true),
      BottomNavbarItem(icon: AssetPaths.icCalendar),
      BottomNavbarItem(icon: ''),
      BottomNavbarItem(icon: AssetPaths.icTasks),
      BottomNavbarItem(icon: AssetPaths.icProfile),
    ]
    );
  }

  NavbarState copyWith(List<BottomNavbarItem>? items) {
    return NavbarState(items: items ?? this.items);
  }
}
