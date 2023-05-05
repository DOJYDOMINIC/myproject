
import 'package:flutter/Material.dart';

class FlexibleButton extends StatelessWidget {
  const FlexibleButton({Key? key, required this.height, required this.width, required this.image, }) : super(key: key);
  final double height;
  final double width;
  final String image;
  // final Color? color;

  @override
  Widget build(BuildContext context) {

    return Container(
      width:width,
      height:height,
      decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image))
      ),
    );
  }
}
