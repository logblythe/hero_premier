import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class FloatingInput extends StatelessWidget {
  final String title;
  final Icon prefixIcon;
  final bool obscureText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final String initialValue = "";
  final String errorText;

  const FloatingInput({
    Key key,
    this.title,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyles.Subtitle1.copyWith(
        color: Theme.of(context).primaryColor,
      ),
      validator: validator,
      decoration: InputDecoration(
          isDense: true,
          labelText: title,
          labelStyle: TextStyles.Subtitle1.copyWith(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).hintColor,
            ),
          ),
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          errorText: errorText),
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}
