// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/remote/api_service.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/core/utilities/app_validator.dart';
import 'package:flutter_app/views/pages/login/login_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';
import 'package:flutter_app/views/widgets/select_widget.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatefulWidget {
  static const routeName='RegisterPage';

  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedGender;

  final formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        ApiService apiService = GetIt.instance<ApiService>();
        await apiService.registerUser(
          nameController.text,
          emailController.text,
          phoneController.text,
          passwordController.text,
          '1',
        );
        Navigator.pushNamed(context, LoginPage.routeName);
      } catch (e) {
        if (kDebugMode) {
          print('Registration failed: $e');
        }
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
        padding: 10.aEdge,
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                18.hSize,
                const MainText.pageTitle('إنشاء حساب'),
                18.hSize,
                MainTextField(
                  key: const Key('nameField'),
                  controller: nameController,
                  hint: 'الإسم',
                  validator: (value) => AppValidator.nameValidate(value),
                ),
                18.hSize,
                MainTextField(
                  key: const Key('emailField'),
                  controller: emailController,
                  hint: 'البريد الإلكتروني',
                  validator: (value) => AppValidator.emailValidate(value),
                ),
                18.hSize,
                MainTextField(
                  controller: passwordController,
                  hint: 'أدخل كلمة المرور',
                  prefixIcon: const Icon(Icons.lock,size: 25),
                  suffixIcon: IconButton(
                    onPressed:  (){},
                    icon: const Icon(Icons.remove_red_eye_outlined
                          ),),
                  obscureText: true,
                  validator: AppValidator.passwordValidate,
                ),
                18.hSize,
                MainTextField(
                  key: const Key('phoneField'),
                  controller: phoneController,
                  hint: 'رقم الهاتف',
                  validator: (value) => AppValidator.phoneValidate(value),
                ),
                18.hSize,
                MainTextField(
                  controller: dateController,
                  hint: 'تاريخ الميلاد',
                  suffixIcon: const Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  },
                ),
                18.hSize,
                CustomSelectorWidget<String>(
                  contentPadding: 10.vEdge,
                  items: const ['Male', 'Female', 'Other'],
                  currentValue: selectedGender,
                  hint: 'النوع',
                  hintAlignment: Alignment.topRight,
                  hintColor: AppColors.primary,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  fillColor: Colors.white,
                ),
                18.hSize,
                MainButton(
                  onPressed: register,
                  child: const MainText.subPageTitle(
                    'إنشاء حساب',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
