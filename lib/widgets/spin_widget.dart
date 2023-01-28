import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spinwheel/constants/color.dart';
import 'package:spinwheel/screens/spin_screen.dart';


class SpinWidjet extends StatefulWidget {
  const SpinWidjet({super.key});

  @override
  State<SpinWidjet> createState() => _SpinWidjetState();
}

class _SpinWidjetState extends State<SpinWidjet> {
  late Timer timer;
  late Random random;
  late String result;
  late double degree;
  late int time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    random = Random();
    degree = 0;
    result = '';
  }

  void rotateWheel() {
    time = 3000;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(360).toDouble();
          result = calculatePoint(degree);
        });

        time = time - 100;
      }
    });
  }

  String calculatePoint(double degree) {
    String res = '';
    int lowPoint = 0;
    int arc = 30;
    int sectors = 12;

    for (int i = sectors; i > 0; i--) {
      if (degree > lowPoint && degree < lowPoint + arc) {
        res = i.toString();
        break;
      }
      lowPoint = lowPoint + arc;
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: ListTile(
        textColor: kWhite,
        iconColor: Colors.green,
        title: Row(
          children: const [
            Text('SPIN TO WIN'),
            Icon(
              Icons.circle,
              size: 14.0,
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            kSizedbox,
            Text(
              'Do you want 30% discount Spin here to get your discouts',
              style: TextStyle(fontSize: 10),
            ),
            kSizedbox
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Column(   
            children: [
              SizedBox(
                height: 400,
                child: Stack(children: [
                  Positioned(
                      child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                        angle: 3.14 / 180 * degree,
                        child: InkWell(
                            onTap: () {
                              rotateWheel();
                             
                              print('rotated');
                            },
                            child: Image.asset(
                              'images/pngwing.com.png',
                              width: 350,
                              height: 350,
                            ))),
                  )),
                  Positioned(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: Transform.rotate(
                        angle: 9.4,
                        child: Image.asset(
                          'images/rout.png',
                          width: 50,
                          height: 50,
                        )),
                  )),
                ]),
              ),
              Text(
                '$result%',
                style: const TextStyle(color: Colors.blue, fontSize: 50),
              ),
             SpinScreen(discount: result,)
            ],
          ),
      ),
    );
    
  }
}
