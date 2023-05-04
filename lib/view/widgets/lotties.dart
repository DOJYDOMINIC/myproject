
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LottiAnime extends StatelessWidget {
  const LottiAnime({Key? key, required this.onTapController,  this.controller, required this.lottieImage}) : super(key: key);


  final VoidCallback onTapController;
  final AnimationController? controller;

  final String lottieImage;

    @override
    Widget build(BuildContext context) {
      return Container(
        height: 150,
        width: 150,
        child: GestureDetector(
          onTap: onTapController,
          child: Lottie.asset(
            height: 110,
            width: 160,
            'anim/${lottieImage}.json',
            controller: controller,
          ),
        ),
      );
  }
}
