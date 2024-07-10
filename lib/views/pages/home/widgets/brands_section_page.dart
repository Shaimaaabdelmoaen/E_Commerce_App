import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/sponsors.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_app/core/data/remote/api_service.dart';
class BrandsPage extends StatefulWidget {
  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  List<Sponsor> _sponsors = [];
  bool _isLoading = true;
  final ApiService _apiService = GetIt.instance<ApiService>();

  @override
  void initState() {
    super.initState();
    _fetchSponsors();
  }

  Future<void> _fetchSponsors() async {
    try {
      final sponsors = await _apiService.fetchSponsors();
      setState(() {
        _sponsors = sponsors;
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
      decoration: BoxDecoration(color: Color(0xFF4A4483), borderRadius: BorderRadius.circular(12)),
      height: MediaQuery.of(context).size.height / 6,
      width: double.infinity,
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _sponsors.length,
        itemBuilder: (context, index) {
          final sponsor = _sponsors[index];
          return Padding(
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(sponsor.image),
            ),
          );
        },
      ),
    );
  }
}
