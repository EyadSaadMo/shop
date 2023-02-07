import 'package:flutter/material.dart';

Widget defaultFormField({
  required String label,
  required IconData prefix,
  required TextInputType type,
  required TextEditingController controller,
  required FormFieldValidator validate,
  bool isPassword = false,
  IconData? suffix,
  Function()? suffixPressed,
  Function(String val)? onFieldSubmit,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onFieldSubmit,
      // onChanged: onChange,
      // onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
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