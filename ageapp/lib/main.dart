import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: MyHomePage(),
  )
);
  class MyHomePage extends StatefulWidget {
    MyHomePage({Key key}) : super(key: key);
  
    @override
    _MyHomePageState createState() => _MyHomePageState();
  }
  
  class _MyHomePageState extends State<MyHomePage> {

    double age = 0.0;
    var selectedYear;

    void _showPicker(){
      showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: DateTime(2020),
        lastDate: DateTime.now()
      ).then((DateTime dt) {
        setState(() {
          selectedYear = dt.year;
          calculateAge();
        });
      });
    }

    void calculateAge(){
      setState(() {
        age = (2020 - selectedYear).toDouble();
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Age Calculator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text(selectedYear != null
                ? selectedYear.toString() 
                   :'Select your of brith'),
                borderSide: BorderSide(color: Colors.black, width: 3.0),
                color: Colors.black,
                onPressed: _showPicker,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              Text('Your age is ${age.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
              )
            ],
          ),
        )
      );
    }
  }