// Author: Ching-Yu

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String buttonText;
  final double width;
  final Color? backgroundColor;
  final Color progressColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const LoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    this.buttonText = 'Log In',
    this.width = 150,
    this.backgroundColor,
    this.progressColor = Colors.white,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  @override
  Widget build(BuildContext context) {    
    return Center(
      child: SizedBox(
        width: width,
        child: FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: isLoading
              ? _buildProgressIndicator(Theme.of(context))
              : _buildButtonText(Theme.of(context)),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(ThemeData theme) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: progressColor,
      ),
    );
  }

  Widget _buildButtonText(ThemeData theme) {
    return Text(
      buttonText,
    );
  }
}