import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  const AgeWeightWidget(
      {Key? key,
      required this.onChanged,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  final Function(int) onChanged;
  final String title;
  final int initValue;
  final int min;
  final int max;

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int count=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count=widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        child: Column(
          children: [
            SizedBox(width: 150,),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        if(count>widget.min){
                          count--;
                        }
                      });
                      widget.onChanged(count);
                    },
                  ),
                  SizedBox(width: 19,),
                  Text(count.toString(),style: TextStyle(color: Colors.black87,fontSize: 18),),
                  SizedBox(width: 19,),
                  InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        if(count >= widget.min){
                          count++;
                        }
                      });
                      widget.onChanged(count);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
