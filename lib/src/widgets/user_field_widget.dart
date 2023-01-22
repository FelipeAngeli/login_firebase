import 'package:flutter/material.dart';

class UserFieldWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const UserFieldWidget({
    super.key,
    required this.label,
    this.icon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.only(left: 20, bottom: 30),
        suffixIcon: icon == null
            ? null
            : Icon(
                icon,
                color: Colors.black,
                size: 18,
              ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1.75),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1.75),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.75),
          borderRadius: BorderRadius.circular(28),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.75),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}
