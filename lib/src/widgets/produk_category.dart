import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../models/category_model.dart';
import 'produk_card.dart';

/*class ProdukCategory extends StatefulWidget {
  @override
  _ProdukCategoryState createState() => _ProdukCategoryState();
}*/

class ProdukCategory extends StatelessWidget {
  final List<Category> _categories = categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index){
          return ProdukCard(
            categoryName: _categories[index].categoryName,
            imagePath: _categories[index].imagePath,
          );
        },
      ),
    );
  }
}