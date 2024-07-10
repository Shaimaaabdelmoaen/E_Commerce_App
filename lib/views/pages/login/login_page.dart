import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/remote/api_service.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/core/utilities/app_validator.dart';
import 'package:flutter_app/views/pages/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'package:flutter_app/views/pages/home/home_page.dart';
import 'package:flutter_app/views/pages/register/register_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_divider.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  Future<void> login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        ApiService apiService = GetIt.instance<ApiService>();
        Map<String, dynamic> userData = await apiService.loginUser(
          emailController.text,
          passwordController.text,
        );
         SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setString('token', userData['token']);

        Navigator.pushNamed(context, BottomNavigationBarPage.routeName);
      } catch (e) {
        print('Login failed: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Image.asset(
          'assets/images/appbar_logo.png',
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MainSpaces.medium(),
                MainText.pageTitle('تسجيل الدخول'),
                MainSpaces.medium(),
                MainTextField(
                  controller: emailController,
                  hint: 'أدخل البريد الإلكتروني',
                  prefixIcon: Icon(Icons.mail_outline,size: 25,),
                  validator: AppValidator.emailValidate,
                ),
                MainSpaces.medium(),
                MainTextField(
                  controller: passwordController,
                  hint: 'أدخل كلمة المرور',
                  prefixIcon: Icon(Icons.lock,size: 25),
                  suffixIcon: IconButton(
                    onPressed:  _togglePasswordVisibility,
                    icon: Icon(
                      _obscureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,),),
                  obscureText: _obscureText,
                  validator: AppValidator.passwordValidate,
                ),
                MainSpaces.medium(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        MainText.title('تذكرنى', color: AppColors.primary),
                      ],
                    ),
                    InkWell(
                      child: MainText.title('هل نسيت كلمة المرور؟', color: AppColors.secondary),
                    ),
                  ],
                ),
                MainSpaces.large(),
                MainButton(
                  child: MainText.subPageTitle(
                    'تسجيل الدخول',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: login
                ),
                MainSpaces.large(),
                MainDivider(title: 'الإستمرار بإستخدام'),
                MainSpaces.medium(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/facebook-logo.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/google-logo.png'),
                    ),
                  ],
                ),
                MainSpaces.large(),
                MainText.title('هل لا تمتلك حساب؟', color: Colors.black45),
                MainSpaces.medium(),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                    child: MainText.title('إنشاء حساب', color: AppColors.secondary)),
                MainSpaces.medium(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
