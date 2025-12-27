import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/person/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/bloc/person/person_event.dart';
import 'package:flutter_bloc_practice/bloc/person/person_state.dart';
import 'package:flutter_bloc_practice/models/person.dart';
import 'package:flutter_bloc_practice/utils/logger.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeLogger();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonBloc>(
      create: (_) => PersonBloc(),
      child: MaterialApp.router(
        title: "Random person", // => String  Name shown in browser app
        debugShowCheckedModeBanner: false, // => bool Remove the debug banner
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: "/",
              builder: (context, state) {
                return MainPage(pageIndex: 0);
              },
            ),
          ],
        ),
        theme: ThemeData(),
        darkTheme: ThemeData(),
        themeMode: ThemeMode
            .system, // => ThemeMode  Set the theme mode of the app to system default
        locale: const Locale("en", "US"),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({required this.pageIndex, super.key});

  final int pageIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main page"), centerTitle: true),
      body: Column(
        children: [
          BlocBuilder<PersonBloc, PersonState>(
            builder: (context, state) {
              if (state is PersonStateLoading) {
                return const CircularProgressIndicator();
              } else if (state is PersonStateLoaded) {
                final personList = state.persons.toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: personList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final person = personList[index];
                      return ListTile(
                        title: Text(person.name),
                        subtitle: Text(person.age.toString()),
                      );
                    },
                  ),
                );
              } else if (state is PersonStateInitial) {
                context.read<PersonBloc>().add(
                  PersonEventLoad(
                    url: "http://127.0.0.1:5500/lib/data/person1.json",
                  ),
                );
              }
              return const Text("No data");
            },
          ),
        ],
      ),
    );
  }
}
