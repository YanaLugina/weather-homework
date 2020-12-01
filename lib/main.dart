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
      child: ListView(
        itemExtent: 100,
        scrollDirection: Axis.vertical,
        children: <Widget> [
          _search(),
          _cityAndDate(),
          _temperature(),
          _snowballs(),
          MyWeatherForWeek(),
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

Padding _temperature() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(
          Icons.wb_sunny,
          color: Colors.white,
          size: 70.0,
        ),
        SizedBox(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '14 * F',
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.white,
              ),
            ),
            Text(
              'LIGHT SNOW',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Container _snowballs () {
  return Container(
    width: 50.0,
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            Snowballs(5),
            Snowballs(3),
            Snowballs(20),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    ),

  );
}

class Snowballs extends StatelessWidget {
  final int degree;

  Snowballs(this.degree);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Icon(Icons.coronavirus, color: Colors.white,),
        Text(
          '$degree',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
        Text(
          '%',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

Widget _temperWidget (temp, day) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        '$day',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(
        height: 5.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            '$temp * F',
            style: TextStyle(color: Colors.white, ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.wb_sunny,
            color: Colors.white,
            size: 30.0,
          ),
        ],
      )
    ],
  );
}

Widget _myWeatherForWeek() {
  final List <List> dayWeek = <List>[
    [ 'Monday', '5'],
    [ 'Tuesday', '7'],
    [ 'Wednesday', '11'],
    [ 'Thursday', '2'],
    [ 'Friday', '10'],
    [ 'Saturday', '4'],
    [ 'Sunday', '4']
  ];

  final List<Widget> tempers = List<Widget>.generate(
    dayWeek.length, (i) => _temperWidget(dayWeek[i][1], dayWeek[i][0]),
    );

  return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemExtent: 150,
      itemCount: tempers.length,
      itemBuilder: (context, index) {
        final temper = tempers[index];
        return Card(
          color: Colors.white30,
          child: Center(
            child: ListTile(
              title: temper,
            ),
          ),
        );
      },
  );
}

class MyWeatherForWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myWeatherForWeek();
  }
}
