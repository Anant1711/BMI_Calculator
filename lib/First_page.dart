import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cards.dart';
import 'cardContent.dart';

const bottomcontainerColour = Colors.lightGreenAccent;
const boxColour = Color(0xFF262740);
const activeColour = Color(0xFF262740);
const inactiveColour = Color(0xFF181928);
const inactiveIcon = Colors.black;
const activeIcon = Colors.white70;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  Color maleBoxColour = inactiveColour;
  Color femaleBoxColour = inactiveColour;
  Color femaleIconColor = inactiveIcon;
  Color maleIconColor = inactiveIcon;
  void colourChange(int gender) {
    if (gender == 1) {
      if (maleBoxColour == inactiveColour) {
        maleBoxColour = activeColour;
        femaleBoxColour = inactiveColour;
        maleIconColor = activeIcon;
        femaleIconColor = inactiveIcon;
      } else {
        maleBoxColour = inactiveColour;
      }
    }
    if (gender == 2) {
      if (femaleBoxColour == inactiveColour) {
        femaleBoxColour = activeColour;
        maleBoxColour = inactiveColour;
        femaleIconColor = activeIcon;
        maleIconColor = inactiveIcon;
      } else {
        femaleBoxColour = inactiveColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI Calculator',
          style: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 40,
          ),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      colourChange(1);
                    });
                  },
                  child: Box(
                    colour: maleBoxColour,
                    cardChild: iconMaterial(
                      colour: maleIconColor,
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      colourChange(2);
                    });
                  },
                  child: Box(
                    colour: femaleBoxColour,
                    cardChild: iconMaterial(
                      colour: femaleIconColor,
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: Box(
                colour: boxColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: EdgeInsets.all(20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 50,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      activeColor: Colors.lightGreenAccent,
                      inactiveColor: Color(0xFF181928),
                      min: 120.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                )),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Box(
                    colour: boxColour,
                    cardChild: Column(
                      children: [Icon(FontAwesomeIcons.male)],
                    )),
              ),
              Expanded(
                child: Box(
                    colour: boxColour,
                    cardChild: Column(
                      children: [Icon(FontAwesomeIcons.mars)],
                    )),
              )
            ],
          )),
          Container(
            decoration: BoxDecoration(
              color: bottomcontainerColour,
              borderRadius: BorderRadius.circular(9.0),
            ),
            margin: EdgeInsets.only(left: 50, top: 15, right: 50, bottom: 15),
            height: 50,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
