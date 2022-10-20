import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int sign = 0;
  var number = [0, 0, 0];
  int flag = 0;
  void myf(int num) {
    setState(() {
      if (flag == 2) {
        flag = 0;
        number[0] = 0;
        number[1] = 0;
      }
      number[flag] = number[flag] * 10;
      number[flag] += num;
    });
  }

  void fplus(int s) {
    sign = s;
    setState(() {
      flag = 1;
    });
  }

  void equal() {
    setState(() {
      flag = 2;
      switch (sign) {
        case 1:
          number[flag] = number[0] + number[1];
          break;
        case 2:
          number[flag] = number[0] - number[1];
          break;
        case 3:
          number[flag] = number[0] * number[1];
          break;
        case 4:
          number[flag] = number[0] ~/ number[1];
          break;
        default:
          print('choose a different number!');
      }
    });
  }

  Widget build(BuildContext context) {
    List<Widget> w = [];
    for (int i = 0; i < 10; i++) {
      w.add(Elev(child: Question(i.toString()), onPressed: () => myf(i)));
    }
    w.add(RaisedButton(child: Question("++"), onPressed: () => fplus(1)));
    w.add(RaisedButton(child: Question("-"), onPressed: () => fplus(2)));
    w.add(RaisedButton(child: Question("*"), onPressed: () => fplus(3)));
    w.add(RaisedButton(child: Question("//"), onPressed: () => fplus(4)));
    w.add(RaisedButton(child: Question("=="), onPressed: () => equal()));
    w.add(Text(number[flag].toString(),
        style: const TextStyle(color: Color(0xff927861))));
    var x = SizedBox(
        width: 200.0,
        height: 100.0,
        child: RaisedButton(child: Question('eee'), onPressed: () => equal()));
    w.add(x);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Question('Welcome to my project')),
            body: Column(children: w)));
  }
}
