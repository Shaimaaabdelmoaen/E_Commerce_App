import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class SectionsPage extends StatefulWidget{

  const SectionsPage({super.key});

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  final List<Map<String, String>> _staticSections = [
    {
      'name': 'قسم العطارة',
      'image': 'assets/images/عطارة.png',
    },
    {
      'name': 'قسم الجبن',
      'image': 'assets/images/جبن.png',
    },
    {
      'name': 'معلبات',
      'image': 'assets/images/معلبات.png',
    },
    {
      'name': 'منتجات الألبان',
      'image': 'assets/images/منتجات_البان.png',
    },
  ];
  @override

  Widget build(BuildContext context) {

    return  SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _staticSections.length,
        itemBuilder: (context, index) {
          final section = _staticSections[index];
          return Padding(
            padding: 8.vhEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                    width: 110,
                    child:Image.asset(section['image']!, fit: BoxFit.cover)
                  ),
                  MainText.subPageTitle(section['name']!),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}