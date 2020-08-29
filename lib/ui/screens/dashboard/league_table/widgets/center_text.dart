import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CenterText extends StatelessWidget {
  final String label;
  final bool focus;

  CenterText(this.label, {bool focus=false}) : this.focus = focus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          label,
          style: focus
              ? TextStyleTable.copyWith(color: Theme.of(context).primaryColor)
              : TextStyleTable,
        ),
      ),
    );
  }
}
