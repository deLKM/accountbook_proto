// Author: Ching-Yu

import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool showPassword;
  final ValueChanged<bool> onTogglePassword;
  final double width;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.controller,
    required this.showPassword,
    required this.onTogglePassword,
    required this.width,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width, 
        child: TextFormField(
          controller: widget.controller,
          obscureText: !widget.showPassword,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock_rounded),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.onTogglePassword(!widget.showPassword);
                });
              }, 
              icon: Icon(widget.showPassword 
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded
              ),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter your Password';
            if (value!.length < 6) return 'At least 6-digit Password is needed';
            return null;
          },
        ),
      ),
    );
  }
}