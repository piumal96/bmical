import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

   ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Score"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Score",
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('UnderWeight', 18.5, Colors.red),
                  GaugeSegment('Normal', 6.4, Colors.green),
                  GaugeSegment('OverWeight', 5, Colors.orange),
                  GaugeSegment('UnderWeight', 10.1, Colors.pink),
                ],
                valueWidget: Text(
                  bmiScore.toStringAsFixed(1),
                  style: TextStyle(fontSize: 40),
                ),
                currentValue: bmiScore.toDouble(),
              ),
              SizedBox(height: 8,),
              Text(bmiStatus!,style: TextStyle(fontSize: 20,color: bmiStatusColor!),),
              SizedBox(height: 5,),
              Text(bmiInterpretation!,style: TextStyle(fontSize: 14),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Re-Calculate")),

                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                  }, child: Text("Share")),

                ],
              )

            ],

          ),
        ),
      ),
    );
  }

  void setBmiInterpretation(){
    if(bmiScore> 30){
      bmiStatus="Obese";
      bmiInterpretation="Please work to reduce obeity";
      bmiStatusColor=Colors.pink;
    }else if(bmiScore>= 25){
      bmiStatus="OverWeight";
      bmiInterpretation="Do regular exercise";
      bmiStatusColor=Colors.orange;
    }else if(bmiScore>= 18.5){
      bmiStatus="Normal";
      bmiInterpretation="Enjoy, Your Fit";
      bmiStatusColor=Colors.green;
    }else if(bmiScore < 18.5){
      bmiStatus="UnderWeight";
      bmiInterpretation="Try to Increase the Weight";
      bmiStatusColor=Colors.red;
    }
  }
}
