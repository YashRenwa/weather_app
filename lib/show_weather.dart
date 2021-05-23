import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/weather_bloc.dart';
import 'package:news_app/weather_model.dart';

class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.only(top: 30, right: 32, left: 32),
      child: Column(
        children: [
          Text(city,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Text(
            weather.getTemp.round().toString() + "C",
            style: TextStyle(color: Colors.white70, fontSize: 50),
          ),
          Text(
            "Temperature",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    weather.getMinTemp.round().toString() + "C",
                    style: TextStyle(color: Colors.white70, fontSize: 50),
                  ),
                  Text(
                    "Min Temperature",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    weather.getMaxTemp.round().toString() + "C",
                    style: TextStyle(color: Colors.white70, fontSize: 50),
                  ),
                  Text(
                    "Max Temperature",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              weatherBloc.add(ResetWeather());
            },
            child: Container(
              width: width,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Reset Location",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
