import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/core/utilities/app_validator.dart';
import 'package:flutter_app/views/pages/home/home_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';

class RegisterPage extends StatefulWidget {
  static const routeName='RegisterPage';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedGender;

  final formKey = GlobalKey<FormState>();

  TextEditingController datecontroller = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

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
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction, // Auto validation mode
            child: Column(
              children: [
                MainSpaces.medium(),
                MainText.pageTitle('إنشاء حساب'),
                MainSpaces.medium(),
                MainTextField(
                  key: Key('nameField'), // Add a unique key for validation
                  controller: namecontroller,
                  hint: 'الإسم',
                  validator: (value) => AppValidator.nameValidate(value),
                ),
                MainSpaces.medium(),
                MainTextField(
                  key: Key('emailField'), // Add a unique key for validation
                  controller: emailcontroller,
                  hint: 'البريد الإلكتروني',
                  validator: (value) => AppValidator.emailValidate(value),
                ),
                MainSpaces.medium(),
                MainTextField(
                  key: Key('phoneField'), // Add a unique key for validation
                  controller: phoneController,
                  hint: 'رقم الهاتف',
                  validator: (value) => AppValidator.phoneValidate(value),
                ),
                MainSpaces.medium(),
                MainTextField(
                  controller: datecontroller,
                  hint: 'تاريخ الميلاد',
                  suffixIcon: Icon(Icons.calendar_today),
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
                        datecontroller.text = formattedDate;
                      });
                    }
                  },
                ),
                MainSpaces.medium(),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'النوع',
                    hintStyle: TextStyle(color: AppColors.primary.withOpacity(.6)),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  value: selectedGender,
                  items: ['Male', 'Female', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                ),
                MainSpaces.large(),
                MainButton(
                  child: MainText.subPageTitle(
                    'إنشاء حساب',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.pushNamed(context, HomePage.routeName);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
