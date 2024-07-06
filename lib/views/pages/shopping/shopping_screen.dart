import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

import '../../../core/utilities/app_color.dart';
import '../productDetails/product_details.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Center(
          child: Image.asset(
              'assets/images/appbar_logo.png'
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite_border)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart)
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetails.routeName);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/pasta.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        MainSpaces.small(),
                        Row(
                          children: [
                            MainText.subPageTitle('مكرونه الملكة',color: Colors.black,),
                            MainSpaces.width(45),
                            Image.asset('assets/images/heart.png')
                          ],
                        ),
                        MainText.body('250جرام'),
                        MainText.title('اقل سهر للكاش 10جنية'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
