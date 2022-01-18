import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/api/services.dart';
import 'package:flutter_bloc_project/bloc/albums/bloc.dart';
import 'package:flutter_bloc_project/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc_project/bloc/theme/theme_state.dart';
import 'package:flutter_bloc_project/screens/albums_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            title: 'Flutter Bloc Demo',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: BlocProvider(
              create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
              child: AlbumsScreen(),
            ),
          );
        },
      ),
    );
  }
}
