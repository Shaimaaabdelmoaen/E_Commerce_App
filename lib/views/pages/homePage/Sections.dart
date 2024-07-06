import 'package:flutter/cupertino.dart';
import '../../widgets/main_text.dart';

class Sections extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    child:Image.asset('assets/images/pasta2.png'),
                  ),
                  MainText.subPageTitle('مكرونة الملكة')
                ],
              ),
            ),
          );
        },

      ),
    );
  }

}