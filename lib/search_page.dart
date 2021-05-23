import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/show_weather.dart';
import 'package:news_app/weather_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/c6/b9/e7/c6b9e73aa16a1cc759908a936f5a3227.jpg"),
            ),
          ),
        ),
        BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherIsNotSearched)
            return Container(
              width: width,
              padding: EdgeInsets.only(top: 30, right: 32, left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Search Weather",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    "Instantly",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: Colors.white70,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white70,
                            style: BorderStyle.solid,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white70,
                            style: BorderStyle.solid,
                          ),
                        ),
                        hintText: "City Name",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      weatherBloc.add(FetchWeather(cityController.text));
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
                        "Search",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          else if (state is WeatherIsLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is WeatherIsLoaded) {
            print("The weather is : ");
            print(state.getWeather);
            return ShowWeather(state.getWeather, cityController.text);
          } else
            return Text(
              "Error",
              style: TextStyle(
                color: Colors.white70,
              ),
            );
        }),
      ],
    );
  }
}
