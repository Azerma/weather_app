import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/ui/cubit/weather/weather_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherCubit weatherCubit = context.read<WeatherCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial || state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherSuccess) {
                  final temp = "${state.response.main?.temp}°C";
                  final pressure = state.response.main?.pressure;
                  final icon = state.response.weather?.first.icon;
                  final iconUrl = "http://openweathermap.org/img/w/$icon.png";
                  return Column(
                    children: [
                      Text(
                        temp.toString(),
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(
                        pressure.toString(),
                        style: const TextStyle(fontSize: 25),
                      ),
                      Image.network(iconUrl
                      ), 
                    ],
                  );
                } else if (state is WeatherFailure) {
                  return const Text(
                    "Failed to get weather info",
                    style: TextStyle(fontSize: 25),
                  );
                } else if (state is WeatherNetworkError) {
                  return const Text(
                    "Network Error",
                    style: TextStyle(fontSize: 25),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: weatherCubit.weatherController,
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () => weatherCubit.getWeatherInfo(),
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}
