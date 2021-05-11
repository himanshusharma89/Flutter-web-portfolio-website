import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../helpers/constants.dart';
import '../main.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        itemCount: socialPlatforms.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              padding: const EdgeInsets.all(2),
              child: InkWell(
                onTap: socialPlatforms[index].onTap,
                customBorder: const CircleBorder(),
                child: FadeInImage.memoryNetwork(
                  width: 30.0,
                  height: 30.0,
                  placeholder: unit8ListPlaceholder,
                  image: socialPlatforms[index].icon,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
