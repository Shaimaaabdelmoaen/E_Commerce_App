import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/remote/api_service.dart';
import 'package:flutter_app/core/models/product.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:get_it/get_it.dart';
class ProductsSectionPage extends StatefulWidget {
  @override
  State<ProductsSectionPage> createState() => _ProductsSectionPageState();
}

class _ProductsSectionPageState extends State<ProductsSectionPage> {
  List<Product> _products = [];
  bool _isLoading = true;
  final ApiService _apiService = GetIt.instance<ApiService>();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final products = await _apiService.fetchProducts();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                    height: 110,
                    width: 110,
                    child: product.image.isNotEmpty
                        ? Image.network('https://app.orientglorygroup.com/public/' + product.image, fit: BoxFit.cover)
                        : Image.asset('assets/images/pasta2.png'),
                  ),
                  MainText.subPageTitle(product.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
