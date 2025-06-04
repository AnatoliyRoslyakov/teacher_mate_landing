import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/resource/jpgs.dart';

class PhoneMockupWidget extends StatelessWidget {
  const PhoneMockupWidget({super.key, required this.scrollPosition});

  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: SizedBox(
          width: 600, //1000
          child: Stack(
            children: [
              Positioned(
                top: 50,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                    width: 350,
                    duration: const Duration(milliseconds: 500),
                    transform: Matrix4.translationValues(
                      0,
                      -scrollPosition * 0.1,
                      0,
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 0.7],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(Jpgs.phoneMocup2, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 200,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                    width: 400,
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.translationValues(
                      0,
                      -scrollPosition * 0.3,
                      0,
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 0.7],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(Jpgs.phoneMocup1, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
