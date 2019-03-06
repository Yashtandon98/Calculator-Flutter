import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: MyHomePage(title: 'Calculator',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = '0';

  String out = '0';
  double a = 0.0;
  double b = 0.0;
  String op = '';

  pressed(String btext){

    if(btext == 'CLEAR'){
      out = '0';
      a = 0.0;
      b = 0.0;
      op = '';
    }

    else if(btext == '+' || btext == '-' || btext == 'X' || btext == '/'){

      a = double.parse(output);
      op = btext;
      out = '0';
    }

    else if(btext == '.'){

      if(out.contains('.')){
        print('Already contains a decimal');
        return;
      }
      else{
        out = out + btext;
      }
    }

    else if(btext == '='){

      b = double.parse(output);

      if(op == '+'){
        out = (a + b).toString();
      }
      if(op == '-'){
        out = (a - b).toString();
      }
      if(op == 'X'){
        out = (a * b).toString();
      }
      if(op == '/'){
        out = (a / b).toString();
      }
      a = 0.0;
      b = 0.0;
      op = '';
    }

    else{
      out = out + btext;
    }

    print(out);

    setState(() {
      output = double.parse(out).toString();
    });
  }

  Widget buildKey(String btext){
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(btext,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
          pressed(btext),
        color: Colors.orange,
        textColor: Colors.black,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(

        child: new Column(children: <Widget>[

          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: new Text(output, style: new TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ))),

          new Expanded(
            child: new Divider(),
          ),
          Column(children: [
            Row(children: [
              buildKey('7'),
              buildKey('8'),
              buildKey('9'),
              buildKey('/'),
              ]),

            Row(children: [
              buildKey('4'),
              buildKey('5'),
              buildKey('6'),
              buildKey('X'),
            ]),

            Row(children: [
              buildKey('1'),
              buildKey('2'),
              buildKey('3'),
              buildKey('-'),
            ]),

            Row(children: [
              buildKey('.'),
              buildKey('0'),
              buildKey('00'),
              buildKey('+'),
            ]),

            Row(children: [
              buildKey('CLEAR'),
              buildKey('='),
            ]),
          ])
        ])
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
