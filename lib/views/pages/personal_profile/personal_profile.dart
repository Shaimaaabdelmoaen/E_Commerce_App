import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';
import 'package:flutter_app/views/widgets/select_widget.dart';


class PersonalProfilePage extends StatefulWidget{
  static const routeName='PersonalProfile';

  const PersonalProfilePage({super.key});

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  String? selectedGender;
  final formKey = GlobalKey<FormState>();

  TextEditingController dateController=TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
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
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Navigates back to the previous screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: 14.aEdge,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                13.hSize,
                 MainTextField(
                   controller: nameController,
                  hint: 'الاسم : محمد ابراهيم',
                  contentPadding: 15.vhEdge,
                ),
                13.hSize,
                MainTextField(
                  controller: emailController,
                  hint: 'البريد الالكترونى',
                  contentPadding: 15.vhEdge,
                ),
                13.hSize,
                 MainTextField(
                   controller: phoneController,
                    hint: 'رقم الهاتف',
                   contentPadding: 15.vhEdge,
                ),
                13.hSize,
                MainTextField(
                  controller: dateController,
                  hint: 'تاريخ الميلاد',
                  suffixIcon: const Icon(Icons.calendar_today),
                  contentPadding: 15.vhEdge,
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
                13.hSize,
                CustomSelectorWidget<String>(
                  contentPadding: 10.vEdge,
                  items: const ['Male', 'Female', 'Other'],
                  currentValue: selectedGender,
                  hint: 'النوع',
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
                13.hSize,
                MainTextField(
                  controller: passwordController,
                  hint: 'كلمة المرور',
                  contentPadding: 15.vhEdge,
                ),
                20.hSize,
                MainButton(
                    child: const MainText.subPageTitle('تحديث',
                      color: Colors.white,
                      textAlign:TextAlign.center ,),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}