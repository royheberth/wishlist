import 'package:wishlist/models/models.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  const CategoryWidget(
      {super.key, required this.category, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 151,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                category.icon,
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${category.name[0].toUpperCase()}${category.name.substring(1).toLowerCase()}",
              style: isSelected
                  ? Theme.of(context).textTheme.headline2
                  : Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
