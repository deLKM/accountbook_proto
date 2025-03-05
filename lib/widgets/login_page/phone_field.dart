// Author: Ching-Yu

import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required TextEditingController phoneController,
    required this.context,
    required this.width,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;
  final BuildContext context;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: _phoneController,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone_iphone_rounded),
            hintText: 'Please enter your 11-digit phone number',
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
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter your phone number';
            if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value!)) return 'Wrong format';
            return null;
          },
        ),
      ),
    );
  }
}