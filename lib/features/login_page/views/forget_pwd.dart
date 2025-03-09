import '../widgets/login_header.dart';
import '../widgets/phone_field.dart';
import '../widgets/code_field.dart';
import '../widgets/password_field.dart';
import '../widgets/login_button.dart';
import '../providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ForgotPwdPage extends ConsumerWidget {
  const ForgotPwdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    final phoneController = TextEditingController();
    final codeController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 头部图标
              LoginHeader(context: context),
              const SizedBox(height: 40),

              // 提示文字
              Text(
                'Please enter your phone number to reset your password.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 40),

              // 电话号码
              PhoneField(
                phoneController: phoneController,
                context: context,
                width: screenWidth * 0.8,
              ),
              const SizedBox(height: 40),

              // 验证码
              CodeField(
                codeController: codeController,
                phoneController: phoneController,
                width: screenWidth * 0.8,
              ),
              const SizedBox(height: 40),

              // 新密码
              PasswordField(
                controller: newPasswordController,
                width: screenWidth * 0.8,
                hintText: 'New Password',
              ),
              const SizedBox(height: 40),

              // 确认新密码
              PasswordField(
                controller: confirmPasswordController,
                width: screenWidth * 0.8,
                hintText: 'Confirm New Password',
              ),
              const SizedBox(height: 40),

              // 重置密码按钮
              LoginButton(
                isLoading: loginState.isLoading,
                onPressed: () => loginNotifier.resetPassword(
                  context,
                  phoneController.text,
                  codeController.text,
                  newPasswordController.text,
                  confirmPasswordController.text,
                ),
                buttonText: 'Reset Password',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}