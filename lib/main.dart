import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
          brightness: Brightness.dark,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: _myWeatherForecast(),
      ),
    );
  }
}

Widget _myWeatherForecast() {
  return ColoredBox(
    color: Colors.red,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          _search(),
          _cityAndDate(),
      /* Row(),
      Row(),*/
          Text('7-DAY WEATHER FORECAST'),
          /*ListView()*/
        ],
      ),
    ),

  );
}

Row _search() {
  final _formKey = GlobalKey<FormState>();
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 5.0,
      ),
      Form(
          key: _formKey,
          child: Container(
            width: 200.0,
            height: 60.0,
            child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter City Name',
                  hintStyle: TextStyle(color: Colors.white)
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                onTap: () => {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
          ),
      ),
    ],
  );
}

Column _cityAndDate() {
  return Column(
    children: <Widget>[
      Text(
        'Murmansk Oblast, RU',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        'Friday, May 20, 2020',
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    ],
  );
}
