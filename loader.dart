import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meditation/Student/login.dart';

class loader extends StatefulWidget {
  @override
  _loaderstate createState() => _loaderstate();
}

class _loaderstate extends State<loader> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double>
      animation_radius_in; //animationg surrounding dots towards center/
  late Animation<double>
      animation_radius_out; // animating surrounding dots outwards from circle
  late Animation<double> animation_rotation;
  final double initialradius = 50;
  double radius = 0;

  @override
  void initState() {
    super.initState();
    navigatetohome(context);
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation_rotation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0, 1, curve: Curves.linear)));

    animation_radius_in = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1, curve: Curves.elasticIn)));

    animation_radius_out = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1) {
          radius = animation_radius_in.value * initialradius;
        } else if (controller.value >= 0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialradius;
        }
      });
    });
    controller.repeat();
  }

// for animated background design
  Widget build(BuildContext) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.blueAccent.shade100,
          Colors.lightBlue.shade200,
          Colors.deepPurple.shade100,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Stack(children: [
        Positioned(
          top: 100,
          right: -50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purpleAccent.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          top: 70,
          right: 100,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          top: 270,
          right: 250,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          bottom: 200,
          right: 40,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          top: 200,
          left: 40,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          top: 400,
          left: 80,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          bottom: -60,
          right: -70,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Positioned(
          bottom: 50,
          left: -50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200,
                    Colors.white24,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              child: const Text(
                '   WELCOME TO \n SEEK AND LEARN',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    inherit: false,
                    shadows: [
                      Shadow(
                          color: Colors.purpleAccent,
                          offset: Offset(2, 1),
                          blurRadius: 2),
                    ]),
              ),
            ), // for loader rotation
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                  child: const Text(
                'LOADING...',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  inherit: false,
                ),
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                child: RotationTransition(
                  turns: animation_rotation,
                  child: Stack(
                    children: <Widget>[
                      dot(
                        color: Colors.black45,
                        radius: 60,
                      ),
                      Transform.translate(
                        offset:
                            Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                        child: dot(
                          color: Colors.redAccent,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                        child: dot(
                          color: Colors.deepOrange.shade300,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                        child: dot(
                          color: Colors.greenAccent.shade400,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                        child: dot(
                          color: Colors.yellowAccent,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                        child: dot(
                          color: Colors.pinkAccent,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                        child: dot(
                          color: Colors.purpleAccent,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                        child: dot(
                          color: Colors.black,
                          radius: 8,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                        child: dot(
                          color: Colors.orangeAccent,
                          radius: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class dot extends StatelessWidget {
  final double radius;
  final Color color;

  dot({this.radius = 5, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

//for splash screen
navigatetohome(BuildContext context) async {
  await Future.delayed(Duration(seconds: 10), () {});

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Loginscreen()));
}
