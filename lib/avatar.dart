import 'package:flutter/material.dart';
import 'main.dart';

class BuildAvatar extends StatelessWidget {
  // final String avatarPic;
  final double radius;
  final String name;
  final double height;
  final double width;
  const BuildAvatar(
      {Key? key,
      required this.radius,
      this.name = "",
      this.height = 80,
      this.width = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: height,
          width: width,
          child: Image.network(
            "${notificationResponse.data![2].image}",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 20.0,
                width: 20.0,
                color: Colors.white,
              ),
            ),
            Image.network(
              "${notificationResponse.data![2].icon}",
              height: 16.0,
              width: 16.0,
            )
          ],
        ),
      ),
    ]);
  }
}
