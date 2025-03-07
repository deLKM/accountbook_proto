// Author: Ching-Yu

import '../widgets/login_header.dart';
import '../../../common/widgets/proto_appbar.dart';
import '../widgets/phone_field.dart';
import '../widgets/code_field.dart';
import '../widgets/social_login.dart';
import '../widgets/helper_buttons.dart';
import '../widgets/password_field.dart';
import '../widgets/toggle_button.dart';
import '../widgets/login_button.dart';
import '../providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final codeController = TextEditingController();

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: ProtoAppBar(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 头部图标
              LoginHeader(context: context),
              const SizedBox(height: 40),

              // 切换登录方式
              ToggleButton(
                isPasswordLogin: loginState.isPasswordLogin,
                onToggle: loginNotifier.toggleLoginType,
              ),
              const SizedBox(height: 40),

              // 电话号码
              PhoneField(
                phoneController: phoneController,
                context: context,
                width: screenWidth * 0.8,
              ),
              const SizedBox(height: 40),

              // 切换密码登陆/短信验证码登录
              loginState.isPasswordLogin
                  ? PasswordField(
                      controller: passwordController,
                      width: screenWidth * 0.8,
                      hintText: 'Password',
                    )
                  : CodeField(
                      codeController: codeController,
                      phoneController: phoneController,
                      width: screenWidth * 0.8,
                    ),
              const SizedBox(height: 40),

              // 登录按钮
              LoginButton(
                isLoading: loginState.isLoading,
                onPressed: () => loginNotifier.mockLogin(context),
              ),
              const SizedBox(height: 40),

              // 帮助功能
              HelperButtons(),
              const SizedBox(height: 80),

              // 第三方登录
              SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }
}