import 'package:flutter/material.dart';

class Height_Widget extends StatefulWidget {
  const Height_Widget({Key? key}) : super(key: key);

  @override
  State<Height_Widget> createState() => _Height_WidgetState();
}
int _height=150;

class _Height_WidgetState extends State<Height_Widget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,shape: const RoundedRectangleBorder(),child: Column(
      children: [
        Text("Height",style: TextStyle(fontSize: 25,color: Colors.grey),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_height.toString(),style: TextStyle(fontSize: 40),),
            SizedBox(width: 5,),
            Text("cm",style: TextStyle(fontSize: 20,color: Colors.grey),),

          ],
        ),
        Slider(max: 240,min: 0,value: _height.toDouble(), onChanged: (value){
          setState(() {
            _height=value.toInt();
          });
        })
      ],
    ),
    );
  }
}
