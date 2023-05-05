import 'package:flutter/material.dart';

class CurveCircular extends StatefulWidget {
  const CurveCircular({Key? key}) : super(key: key);

  @override
  State<CurveCircular> createState() => _CurveCircularState();
}

class _CurveCircularState extends State<CurveCircular>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _raduisAnimation;

  @override
  void initState() {
    super.initState();

// animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
//rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

//radius animation
    _raduisAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildColorContainer(
              width: 220,
              height: 220,
              color: Colors.purple,
              angle: 0.0,
            ),
            buildColorContainer(
              width: 200,
              height: 200,
              color: Colors.purple.shade300,
              angle: 0.1,
            ),
            buildColorContainer(
              width: 180,
              height: 180,
              color: Colors.white,
              angle: 0.2,
            ),
            buildColorContainer(
              width: 160,
              height: 160,
              color: Colors.blue,
              angle: 0.0,
            ),
            buildColorContainer(
              height: 140,
              width: 140,
              color: Colors.green,
              angle: 0.0,
            ),
            buildColorContainer(
              height: 120,
              width: 120,
              color: Colors.yellow.shade300,
              angle: 0.1,
            ),
            buildColorContainer(
              height: 100,
              width: 100,
              color: Colors.orange,
              angle: 0.2,
            ),
            buildColorContainer(
              height: 80,
              width: 80,
              color: Colors.red,
              angle: 0.4,
            ),
            buildColorContainer(
              height: 30,
              width: 30,
              color: Colors.white,
              angle: 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorContainer({
    required double height,
    required double width,
    required Color color,
    required double angle,
  }) {
    return Transform.rotate(
      angle: _rotationAnimation.value + angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2.0, 3.0))
            ],
            color: color,
            borderRadius: BorderRadius.circular(_raduisAnimation.value)),
      ),
    );
  }
}
