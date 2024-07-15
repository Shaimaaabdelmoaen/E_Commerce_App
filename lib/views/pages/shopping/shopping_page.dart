import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/views/pages/product_details/product_details.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      appBar: const MainAppBar(),
      body: ListView.builder(
        itemCount: (10 / 2).ceil(),
        itemBuilder: (context, rowIndex) {
          return Padding(
            padding: 10.aEdge,
            child: Row(
              children: List.generate(2, (colIndex) {
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ProductDetailsPage.routeName);
                    },
                    child: Padding(
                      padding: 5.vhEdge,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  color: Colors.grey,
                                  child: Image.asset(
                                    'assets/images/pasta.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              15.hSize,
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const MainText.subPageTitle('مكرونه الملكة',
                                      color: Colors.black),
                                  Image.asset('assets/images/heart.png'),
                                ],
                              ),
                              const MainText.body('250جرام'),
                              const MainText.title('اقل سهر للكاش 10جنية'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
