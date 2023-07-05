import 'package:flutter/material.dart';
import '../colors.dart';
import '../geocalisation/getLocation.dart';
import '../weather/weatherData.dart';
import 'border_radius.dart';

class WeatherW extends StatefulWidget {
  final Size size;

  WeatherW({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _WeatherWState createState() => _WeatherWState();
}

class _WeatherWState extends State<WeatherW> {
  late WeatherData client;
  var data;

  @override
  void initState() {
    super.initState();
    client = WeatherData();
    getData();
  }

  Future<void> getData() async {
    var position = await GetPosition();
    data = await client.getData(position.latitude, position.longitude);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          width: widget.size.width,
          decoration: BoxDecoration(
            borderRadius: bottomRadius(),
          ),
          child: data == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https:${data?.icon}',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: Text(
                        '${data?.temp} °C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
