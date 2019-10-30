import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_model.dart';
import 'package:weather_app/utilities/constants.dart';
import 'city_screen.dart';

class WeatherHome extends StatefulWidget {
  WeatherHome({this.weatherLocation});
  final weatherLocation;
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  WeatherModel weatherModel = WeatherModel();
  String weatherIcon;
  int temperature;
  String cityName;
  double windSpeed;
  int humidity;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherLocation);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        humidity = 0;
        windSpeed = 0;
        weatherIcon = 'Error';
        cityName = '';
        return;
      }
      var condition = weatherData['weather'][0]['id'];
      humidity = weatherData['main']['humidity'];
      windSpeed = weatherData['wind']['speed'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      double temp = weatherData['main']['temp'];
      cityName = weatherData['name'];
      temperature = temp.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF42BFEC),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 35,
              right: 35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    var weatherData = await weatherModel.getLocationWeather();
                    updateUI(weatherData);
                  },
                ),
                SizedBox(
                  width: 215,
                ),
                IconButton(
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    var typedName = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }),
                    );
                    if (typedName != null) {
                      var weatherData =
                          await weatherModel.getCityWeather(typedName);
                      updateUI(weatherData);
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Row(
              children: <Widget>[
                Text(
                  'Weather',
                  style: kWeatherTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'App',
                  style: kAppTextStyle ,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        cityName,
                        style: kCityTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                      image: AssetImage('assets/$weatherIcon'),
                      height: 120,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Temperature :',
                          style: kScondaryTitleTextStyle,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$temperature°',
                          style: kValuesTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Humidity :',
                          style: kScondaryTitleTextStyle,
                        ),
                        SizedBox(
                          width: 49,
                        ),
                        Text(
                          '$humidity',
                          style: kValuesTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Wind Speed :',
                          style: kScondaryTitleTextStyle,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '$windSpeed',
                          style: kValuesTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
