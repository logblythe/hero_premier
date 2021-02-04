import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';

class AdBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetPaths.TUBORG,
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}
