import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF42BFEC),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              style: TextStyle(
                height: 1.2,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              onChanged: (value){
                cityName = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(
                  Icons.location_city,
                  color: Colors.white,
                ),
                hintText: 'Enter city name',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context, cityName);
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
