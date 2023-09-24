


import 'package:azkar/bloc_observer.dart';
import 'package:azkar/model/home_model.dart';
import 'package:azkar/modules/cubit/cubit.dart';
import 'package:azkar/modules/home_details.dart';
import 'package:azkar/modules/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {


  WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer=MyBlocObserver();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {



   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..loadSections(context)..loadSectionsDetails(context),
      child: MaterialApp(

        theme: ThemeData(
scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
            color: Colors.teal
          )
        ),
        home: HomeScreen()
      ),
    );
  }
}

