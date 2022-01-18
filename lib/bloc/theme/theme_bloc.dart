import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/theme/theme_events.dart';
import 'package:flutter_bloc_project/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  //
  ThemeBloc()
      : super(
          ThemeState(
            themeData: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.teal,
              backgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(
        themeData: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.teal,
          backgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
    }
  }
}
