import 'package:flutter/material.dart';

Widget myTextFeild({
  required String hintText,
  required TextEditingController controller,
  required IconData icon,
}) =>
    TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (ValueKey) {
        if (ValueKey!.isEmpty) {
          return '$hintText required';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
