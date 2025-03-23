import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/models/weather_response.dart';
import 'package:quiz/data/services/weather_services.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final weatherController = TextEditingController();

  void getWeatherInfo() async {
    try {
      emit(WeatherLoading());
      final result =
          await WeatherServices.getWeatherInfo(weatherController.text);
      emit(WeatherSuccess(response: result));

    } on SocketException {
      emit(WeatherNetworkError());
    }
    catch (e) {
      emit(WeatherFailure());
    }
  }
}
