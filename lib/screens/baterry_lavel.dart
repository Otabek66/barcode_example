import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaterryLavel extends StatefulWidget {
  const BaterryLavel({Key? key}) : super(key: key);

  @override
  State<BaterryLavel> createState() => _BaterryLavelState();
}

class _BaterryLavelState extends State<BaterryLavel> {
  static const baterryChanel = MethodChannel("otabek.com/battery");

  String baterryLevel = "Waiting...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Batarry lavel")),
    body: Center(child: Column(children: [
      Text(baterryLevel),
      ElevatedButton(onPressed: 
        getBatteryLavel,
       child: Text("Battery level"))
    ],)),
    );
  }

  Future getBatteryLavel() async{
    final arguments = {"name":"Sarah Abs"};
    final int newBatteryLevel =
        await baterryChanel.invokeMethod("getBatteryLavel", arguments);

    setState(() =>
      baterryLevel = "$newBatteryLevel"
    );
  }
}