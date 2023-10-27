import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime dt = DateTime.now();
  Widget getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset('assets/1.png');
      case > 300 && <= 400:
        return Image.asset('assets/2.png');
      case > 500 && <= 600:
        return Image.asset('assets/3.png');
      case > 600 && <= 700:
        return Image.asset('assets/4.png');
      case > 700 && <= 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/1.png');
    }
  }

  Widget getWishes() {
    var now = DateTime.now();
    String timeOfDay = DateFormat('HH:mm:ss').format(now);
    String timeString = timeOfDay[0] +
        timeOfDay[1] +
        timeOfDay[3] +
        timeOfDay[4] +
        timeOfDay[6] +
        timeOfDay[7];
    int Time = int.parse(timeString);

    String salutation = "Good Night";
    if (Time >= 030000 && Time < 120000) {
      salutation = "Good Morning";
    } else if (Time >= 120000 && Time < 160000) {
      salutation = "Good Afternoon";
    } else if (Time >= 160000 && Time < 210000) {
      salutation = "Good Evening";
    } else {
      salutation = "Good Night";
    }

    return Text(
      salutation,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Color primaryColour() {
    var now = DateTime.now();
    String timeOfDay = DateFormat('HH:mm:ss').format(now);
    String timeString = timeOfDay[0] +
        timeOfDay[1] +
        timeOfDay[3] +
        timeOfDay[4] +
        timeOfDay[6] +
        timeOfDay[7];
    int Time = int.parse(timeString);

    Color pColor;
    if (Time >= 030000 && Time < 120000) {
      pColor = const Color(0xFFBD986C);
    } else if (Time >= 120000 && Time < 160000) {
      pColor = const Color(0xFF6465A5);
    } else if (Time >= 160000 && Time < 210000) {
      pColor = const Color(0xFFE1533F);
    } else {
      pColor = const Color(0xFF3D1C51);
    }
    return pColor;
  }

  Color secondaryColour() {
    var now = DateTime.now();
    String timeOfDay = DateFormat('HH:mm:ss').format(now);
    String timeString = timeOfDay[0] +
        timeOfDay[1] +
        timeOfDay[3] +
        timeOfDay[4] +
        timeOfDay[6] +
        timeOfDay[7];
    int Time = int.parse(timeString);

    Color pColor;
    if (Time >= 030000 && Time < 120000) {
      pColor = const Color(0xFFF99740);
    } else if (Time >= 120000 && Time < 160000) {
      pColor = const Color(0xFF6975A6);
    } else if (Time >= 160000 && Time < 210000) {
      pColor = const Color(0xFFF17F57);
    } else {
      pColor = const Color(0xFF7E397C);
    }
    return pColor;
  }

  Color MainColour() {
    var now = DateTime.now();
    String timeOfDay = DateFormat('HH:mm:ss').format(now);
    String timeString = timeOfDay[0] +
        timeOfDay[1] +
        timeOfDay[3] +
        timeOfDay[4] +
        timeOfDay[6] +
        timeOfDay[7];
    int Time = int.parse(timeString);

    Color pColor;
    if (Time >= 030000 && Time < 120000) {
      pColor = const Color(0xFFCF5F31);
    } else if (Time >= 120000 && Time < 160000) {
      pColor = const Color(0xFFF28A30);
    } else if (Time >= 160000 && Time < 210000) {
      pColor = const Color(0xFF4F0F46);
    } else {
      pColor = const Color(0xFF000000);
    }
    return pColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColour(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 20, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3.0, -0.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColour(),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3.0, -0.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColour(),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    color: primaryColour(),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.weather.areaName}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          getWishes(),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              DateFormat('EE dd •').add_jm().format(dt),
                              //'Friday 16 • 09.41am',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        //'5:34 am',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        //'5:34 pm',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Max',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Min',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
