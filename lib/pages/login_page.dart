// Author: Ching-Yu

import '../widgets/login_page/login_header.dart';
import '../widgets/login_page/proto_appbar.dart';
import '../widgets/login_page/phone_field.dart';
import '../widgets/login_page/code_field.dart';
import '../widgets/login_page/social_login.dart';
import '../widgets/login_page/helper_buttons.dart';
import '../widgets/login_page/password_field.dart';
import '../widgets/login_page/toggle_button.dart';
import '../widgets/login_page/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();

  bool _isPasswordLogin = true;
  bool _showPassword = false;
  bool _isLoading = false;
  
  void _toggleLoginType() {
    setState(() {
      _isPasswordLogin = !_isPasswordLogin;
    });
  }

  Future<void> _mockLogin() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟一个耗时操作（例如请求API），延迟2秒
      await Future.delayed(const Duration(seconds: 2));
      
      // 假设登录成功
      bool loginSuccess = true;
      if(!mounted) return;
      
      setState(() { 
        _isLoading = false;
      });

      if (loginSuccess) {
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please try again.')
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: ProtoAppBar(title: 'Account Book Proto'),
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
              ToggleButton(isPasswordLogin: _isPasswordLogin, onToggle: _toggleLoginType),
              const SizedBox(height: 40),
              
              // 电话号码
              PhoneField(phoneController: _phoneController, context: context, width: screenWidth * 0.8),
              const SizedBox(height: 40),

              // 切换密码登陆/短信验证码登录
              _isPasswordLogin 
                ? PasswordField(
                    controller: _passwordController, 
                    showPassword: _showPassword, 
                    onTogglePassword: (value) =>
                      setState(() {
                        _showPassword = value;
                      }),
                    width: screenWidth * 0.8,
                  ) 
                : CodeField(
                    codeController: _codeController, 
                    context: context, 
                    width: screenWidth * 0.8,
                  ),
              const SizedBox(height: 40),

              // 登录按钮
              LoginButton(
                isLoading: _isLoading,
                onPressed: _mockLogin,
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