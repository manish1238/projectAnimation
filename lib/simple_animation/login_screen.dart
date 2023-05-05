import 'package:animationproject/simple_animation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../card_flip.dart';
import '../curve_circular.dart';
import 'fade_animation.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red,
        body: SingleChildScrollView(
      child: Obx(() => Container(
            decoration: BoxDecoration(
              gradient: _controller.gradient.value,
              // gradient: LinearGradient(
              //   colors: [
              //     _controller.colors[_controller.counter].value,
              //     _controller
              //         .colors[
              //             (_controller.counter + 1) % _controller.colors.length]
              //         .value,
              //   ],
              // ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/small_light.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/light_two.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/clock.png'),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FlipAnimation()),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Colors.deepPurpleAccent,
                                    Colors.blue,
                                  ])),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          2.5,
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CurveCircular()),
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
