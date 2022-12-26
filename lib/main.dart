import 'package:alt_twitter/src/common/custom_colors.dart';
import 'package:alt_twitter/src/features/trends/trend_service.dart';
import 'package:alt_twitter/src/features/trends/trends.dart';
import 'package:alt_twitter/src/home_screen.dart';
import 'package:alt_twitter/src/menu/menu.dart';
import 'package:alt_twitter/src/menu/menu_bloc.dart';
import 'package:alt_twitter/src/profile/profile.dart';
import 'package:alt_twitter/src/services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'src/common/author.dart';

final locator = GetIt.instance;

void main() {
  final author = Author("3", "arielbh", "Ariel Ben Horesh", "images/ariel.png");
  locator.registerLazySingleton(() => MessageService(loggedAuthor: author));
  locator.registerSingleton(author);
  locator.registerLazySingleton(() => TrendService()..start());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        extensions: [
          CustomColors.light,
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: [
          CustomColors.dark,
        ],
      ),
      themeMode: ThemeMode.system,
      home: const Layout(title: 'ALT.T*itter', child: HomeScreen()),
    );
  }
}

class Layout extends StatefulWidget {
  const Layout({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late Widget currentChild;
  @override
  void initState() {
    super.initState();
    currentChild = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: BlocProvider<MenuBloc>(
                  create: (context) => MenuBloc(),
                  child: Menu(
                    onNavigate: (route) => setState(() {
                      switch (route) {
                        case "/home":
                          currentChild = const HomeScreen();
                          break;
                        case "/profile":
                          currentChild = const Profile();
                          break;
                        default:
                      }
                    }),
                  ),
                ),
              )),
              BlocProvider<MessageService>(
                create: (context) => locator<MessageService>(),
                child: Expanded(child: Padding(padding: const EdgeInsets.only(right: 12), child: currentChild)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: BlocProvider<TrendService>(
                  create: (context) => locator<TrendService>(),
                  child: const Trends(),
                ),
              )),
            ],
          ),
        ));
  }
}
