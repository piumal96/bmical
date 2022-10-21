import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  final Function(int) onChange;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

int _gender = 0;

final ChoiceChip3DStyle selectedStyle= ChoiceChip3DStyle(
  topColor: Colors.grey[200]!,
  backColor: Colors.grey[300]!,
  borderRadius: BorderRadius.circular(20),
);

final ChoiceChip3DStyle unselectedStyle= ChoiceChip3DStyle(
topColor: Colors.white,
backColor: Colors.grey[300]!,
borderRadius: BorderRadius.circular(20),
);

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(color: Colors.grey),
              style: _gender==1 ? selectedStyle:unselectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },

              selected: _gender == 1,
              onUnSelected: () {
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/men.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Male")
                ],
              )),
          SizedBox(
            width: 5,
          ),
          ChoiceChip3D(
              border: Border.all(color: Colors.grey),
              style: _gender==2? selectedStyle:unselectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },

              selected: _gender==2,
              onUnSelected: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/women.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Women")
                ],
              )),
        ],
      ),
    );
  }
}
