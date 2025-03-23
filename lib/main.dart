import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:quiz/ui/cubit/weather/weather_cubit.dart';
import 'package:quiz/ui/pages/weather/weather_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => WeatherCubit()..getWeatherInfo(),
        child: const WeatherPage(),
      ),
    );
  }
}
