import 'package:flutter/material.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  double result = 0;
  String sresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 130,
                  child: TextField(
                    controller: height,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.amber),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.amber[200])),
                  )),
              Container(
                  width: 130,
                  child: TextField(
                    controller: weight,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.amber),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.amber[200])),
                  ))
            ],
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              double h = double.parse(height.text);
              double w = double.parse(weight.text);
              setState(() {
                result = w / (h * h);
                if (result > 25) {
                  sresult = "your over weight";
                } else if (result >= 18.5 && result <= 25) {
                  sresult = "you have normal weight";
                } else {
                  sresult = "your skinny";
                }
              });
            },
            child: Container(
              child: Text(
                'calculate',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.amber),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Text("$result",
                style: TextStyle(fontSize: 60, color: Colors.amber)),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: sresult.isNotEmpty,
            child: Container(
              child: Text(sresult,
                  style: TextStyle(fontSize: 40, color: Colors.amber)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LeftBar(barWidth: 40),
          SizedBox(
            height: 20,
          ),
          LeftBar(barWidth: 70),
          SizedBox(
            height: 20,
          ),
          LeftBar(barWidth: 40),
          SizedBox(
            height: 40,
          ),
          RightBar(barWidth: 40),
          SizedBox(
            height: 10,
          ),
          RightBar(barWidth: 70),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 40),
        ],
      )),
    );
  }
}
