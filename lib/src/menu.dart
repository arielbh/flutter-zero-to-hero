import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> _menuItems = [
    MenuItem("Home", Icons.home, true),
    MenuItem("Explore", Icons.airport_shuttle_outlined),
    MenuItem("Notifications", Icons.notifications),
    MenuItem("Messages", Icons.message),
    MenuItem("Bookmarks", Icons.bookmark_border),
    MenuItem("Lists", Icons.list),
    MenuItem("Profile", Icons.person),
  ];
  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _menuItems.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Icon(_menuItems[index].icon),
            const SizedBox(width: 12.0),
            Text(
              _menuItems[index].name,
              style: Theme.of(context).textTheme.button,
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final IconData icon;
  final bool isSelected;

  MenuItem(this.name, this.icon, [this.isSelected = false]);
}
