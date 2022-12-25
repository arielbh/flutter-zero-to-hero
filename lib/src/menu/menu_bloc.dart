import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MenuEvent {}

class NavigateEvent extends MenuEvent {
  final String name;

  NavigateEvent(this.name);
}

class AltMenuItem {
  final String name;
  final IconData icon;
  final bool isSelected;

  AltMenuItem(this.name, this.icon, [this.isSelected = false]);
  AltMenuItem select() {
    return AltMenuItem(name, icon, true);
  }

  AltMenuItem unSelect() {
    return AltMenuItem(name, icon, false);
  }
}

class MenuBloc extends Bloc<MenuEvent, List<AltMenuItem>> {
  MenuBloc()
      : super([
          AltMenuItem("Home", Icons.home, true),
          AltMenuItem("Explore", Icons.airport_shuttle_outlined),
          AltMenuItem("Notifications", Icons.notifications),
          AltMenuItem("Messages", Icons.message),
          AltMenuItem("Bookmarks", Icons.bookmark_border),
          AltMenuItem("Lists", Icons.list),
          AltMenuItem("Profile", Icons.person),
        ]) {
    on<NavigateEvent>((event, emit) {
      final list = [...state];
      final currentlySelectedIndex = list.indexWhere((element) => element.isSelected);
      list[currentlySelectedIndex] = list[currentlySelectedIndex].unSelect();
      final toSelectIndex = list.indexWhere((element) => element.name == event.name);
      list[toSelectIndex] = list[toSelectIndex].select();
      emit(list);
    });
  }
}
