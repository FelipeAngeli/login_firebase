import 'package:flutter/material.dart';

class PasswordFieldWidger extends StatefulWidget {
  final String label;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const PasswordFieldWidger({
    super.key,
    required this.label,
    this.validator,
    this.onSaved,
  });

  @override
  State<PasswordFieldWidger> createState() => _PasswordFieldWidgerState();
}

class _PasswordFieldWidgerState extends State<PasswordFieldWidger> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      obscureText: _isObscure,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.only(left: 20, bottom: 30),
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            color: Colors.black,
            iconSize: 18,
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
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
