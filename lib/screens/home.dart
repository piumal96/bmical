import 'package:bmical/widget/gender_widget.dart';
import 'package:flutter/material.dart';

import '../widget/height_widget.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}
int _gender=0;
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GenderWidget(onChange: (genderVal ) { _gender=genderVal; },),
            Height_Widget(),
          ],
        ),
      ),
    );
  }
}
