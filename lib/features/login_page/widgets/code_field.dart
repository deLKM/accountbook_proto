// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'dart:async';

class CodeField extends StatefulWidget {
  const CodeField({
    super.key,
    required TextEditingController codeController,
    required TextEditingController phoneController,
    required this.context,
    required this.width,
  }) : _codeController = codeController,
    _phoneController = phoneController;

  final TextEditingController _codeController;
  final TextEditingController _phoneController;
  final BuildContext context;
  final double width;

  @override
  State<CodeField> createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  int _countdown = 0;
  Timer? _timer;

  Future<void> _getCaptcha() async {
    if (_countdown > 0) return;

    if (widget._phoneController.text.isEmpty) {
      ScaffoldMessenger.of(widget.context).showSnackBar(
        const SnackBar(content: Text('Enter Your Phone number firstly')),
      );
      return;
    }

    try {
      // 这里替换为实际的验证码请求API调用
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      setState(() => _countdown = 60);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
          } else {
            _timer?.cancel();
          }
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: CAPTCHA error $e')),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width, 
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._codeController,
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
              onPressed: _countdown == 0 ? _getCaptcha : null, 
              child: const Text('Get the CAPTCHA'),
            ),
          ],
        ),
      ),
    );
  }
}
