// Author: Ching-Yu

import 'package:flutter/material.dart';

class CodeField extends StatelessWidget {
  const CodeField({
    super.key,
    required TextEditingController codeController,
    required this.context,
    required this.width,
  }) : _codeController = codeController;

  final TextEditingController _codeController;
  final BuildContext context;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width, 
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: 'CAPTCHA',
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
                  prefixIcon: Icon(Icons.sms_rounded),
                  hintText: 'Please enter 6-digit CAPTCHA'
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Please enter the CAPTCHA';
                  if (value!.length != 6) return 'At least 6-digit CAPTCHA is needed';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {}, 
              child: const Text('Get the CAPTCHA'),
            ),
          ],
        ),
      ),
    );
  }
}
