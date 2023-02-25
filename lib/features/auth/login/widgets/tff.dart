import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/style/colors.dart';

Widget defaultFormField({
  required String label,
  required Widget prefix,
  required TextInputType type,
  required TextEditingController controller,
  required FormFieldValidator validate,
  bool isPassword = false,
  IconData? suffix,
  Function()? suffixPressed,
  Function(String val)? onFieldSubmit,
  bool isClickable = true,
  required BuildContext context,
}) =>
    TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onFieldSubmit,
      // onChanged: onChange,
      // onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,labelStyle: Theme.of(context).textTheme.bodyText1,
        prefixIcon:prefix,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),

    );