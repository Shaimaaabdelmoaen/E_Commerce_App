// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final List<String> _staticImages = [
    'assets/images/spiro_spatch.png',
    'assets/images/beyti.png',
    'assets/images/juhayna.png',
    'assets/images/domty.png',
    'assets/images/pasta.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4A4483),
        borderRadius: BorderRadius.circular(12),
      ),
      height: MediaQuery.of(context).size.height / 7,
      width: double.infinity,
      child: Padding(
        padding: 15.vhEdge,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _staticImages.length,
          itemBuilder: (context, index) {
            final imageUrl = _staticImages[index];
            return Padding(
              padding:5.vhEdge,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(imageUrl)
              ),
            );
          },
        ),
      ),
    );
  }
}
