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
            labelText: '手机号',
            prefixIcon: const Icon(Icons.phone_iphone_rounded),
            hintText: '请输入11位手机号',
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return '请输入您的手机号码';
            if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value!)) return '手机号格式错误';
            return null;
          },
        ),
      ),
    );
  }
}