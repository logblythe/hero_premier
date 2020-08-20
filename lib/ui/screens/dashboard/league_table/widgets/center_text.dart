import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CenterText extends StatelessWidget {
  final String label;

  const CenterText(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          label,
          style: TextStyleTable,
        ),
      ),
    );
  }
}
