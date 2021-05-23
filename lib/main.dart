import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/search_page.dart';
import 'package:news_app/weather_bloc.dart';
import 'package:news_app/weather_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: BlocProvider(
            create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
            child: SearchPage(),
          )),
    );
  }
}
