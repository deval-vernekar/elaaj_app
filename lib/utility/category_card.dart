import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final iconImagePath;
  final categoryName;
  CategoryCard({
    required this.iconImagePath,
    required this.categoryName,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFFBCAA7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              iconImagePath,
              height: 30,
              width: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
