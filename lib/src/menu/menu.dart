import 'package:alt_twitter/src/menu/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Menu extends StatelessWidget {
  final void Function(String) onNavigate;
  const Menu({Key? key, required this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, List<AltMenuItem>>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.read<MenuBloc>().add(NavigateEvent(state[index].name));
              onNavigate('/${state[index].name.toLowerCase()}');
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Icon(state[index].icon),
                  const SizedBox(width: 12.0),
                  Text(
                    state[index].name,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          fontWeight: state[index].isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
