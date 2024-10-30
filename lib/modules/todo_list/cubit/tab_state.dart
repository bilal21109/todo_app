part of 'tab_cubit.dart';


class TabsState {
  final List<TabModel> tabs;
  TabsState({required this.tabs});

  factory TabsState.initial() {
    return TabsState(tabs: [
      TabModel(name: 'All', status: 'all', isSelected: true),
      TabModel(name: 'Todo', status: TodoProgressStatus.pending.name),
      TabModel(name: 'Progress', status: TodoProgressStatus.inProgress.name),
      TabModel(name: 'Complete', status: TodoProgressStatus.complete.name),
    ]);
  }

  TabsState copyWith({List<TabModel>? tabs}) {
    return TabsState(tabs: tabs ?? this.tabs);
  }
}
