import 'package:bmical/widget/age_weight_widget.dart';
import 'package:bmical/widget/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../widget/height_widget.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

int _gender = 0;
int _height = 150;
int _age = 26;
int _weight = 68;

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              GenderWidget(
                onChange: (genderVal) {
                  _gender = genderVal;
                },
              ),
              Height_Widget(
                onChange: (heightVal) {
                  _height = _height;
                },
              ),
              Row(
                children: [
                  AgeWeightWidget(
                      onChanged: (ageVal) {
                        _weight = ageVal;
                      },
                      title: "Age",
                      initValue: 0,
                      min: 0,
                      max: 100),
                  AgeWeightWidget(
                      onChanged: (ageVal) {
                        _weight = ageVal;
                      },
                      title: "Weight(Kg)",
                      initValue: 5,
                      min: 0,
                      max: 100),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: SwipeableButtonView(
                    onFinish: () {},
                    onWaitingProcess: () {},
                    activeColor: Colors.blueAccent,
                    buttonWidget: Icon(Icons.arrow_forward_ios_rounded),
                    buttonText: "CALCULATE"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
