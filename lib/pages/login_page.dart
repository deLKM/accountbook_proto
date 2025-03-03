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

    // 模拟一个耗时操作，延迟2秒
    await Future.delayed(const Duration(seconds: 2));
    setState(() { 
      _isLoading = false;
    });
    
    // 这里可以添加导航到主页的逻辑
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 头部图标
              _buildHeader(),
              const SizedBox(height: 40),

              // 切换登录方式
              _buildToggleButton(),
              const SizedBox(height: 40),
              
              // 电话号码
              _buildPhoneField(),
              const SizedBox(height: 40),

              // 切换密码登陆还是短信验证码登录
              _isPasswordLogin ? _buildPasswordField() : _buildCodeField(),
              const SizedBox(height: 40),

              // 登录按钮
              _buildLoginButton(),
              const SizedBox(height: 40),

              // 帮助功能
              _buildHelperButtons(),
              const SizedBox(height: 40),

              //
              _buildSocialLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Icon(
          Icons.account_balance_wallet,
          size: 80,
          color: Colors.blue,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildToggleButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _isPasswordLogin ? 'SMS Login' : 'Password Login',
          style: const TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: _toggleLoginType, 
          child: Text(
            _isPasswordLogin ? 'Switch to SMS Login' : 'Switch to Password Login',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: Icon(Icons.phone_iphone_rounded),
        hintText: 'Please enter your 11-digit phone number',
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Please enter your phone number';
        if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value!)) return 'Wrong format';
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          }, 
          icon: Icon(_showPassword 
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
    );
  }

  Widget _buildCodeField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _codeController,
            decoration: const InputDecoration(
              labelText: 'CAPTCHA',
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
    );
  }

  Widget _buildLoginButton() {
    return FilledButton(
      onPressed: _isLoading ? null : _mockLogin, 
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: _isLoading 
        ? const SizedBox(
          child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
          'Log In',
          style: TextStyle(fontSize: 16),
        ),
    );
  }

  Widget _buildHelperButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {}, // 跳转注册页面
          child: const Text('Sign Up'),
        ),
        TextButton(
          onPressed: () {}, // 跳转忘记密码
          child: const Text('Forgot your Password?'),
        ),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Other Ways'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton.outlined(
              iconSize: 40,
              onPressed: () {}, // 微信登录
              icon: const Icon(Icons.wechat_rounded),
            ),
            IconButton.outlined(
              iconSize: 40,
              onPressed: () {}, // QQ登录
              icon: const Icon(Icons.quick_contacts_dialer_rounded),
            ),
          ],
        ),
      ],
    );
  }
}