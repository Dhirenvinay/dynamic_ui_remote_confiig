import 'package:dynamiui/app_config.dart';
import 'package:flutter/material.dart';

class GrideBuilder extends StatelessWidget {
  const GrideBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: AppConfig.grideViewCrossAxis,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          _buildCategoryItem(
            context,
            "Living Room",
            Icons.weekend,
            "PRICE DROP",
          ),
          _buildCategoryItem(context, "Bedroom", Icons.bed, "PRICE DROP"),
          _buildCategoryItem(context, "Storage", Icons.storage, ""),
          _buildCategoryItem(context, "Study", Icons.book, "NEW"),
          _buildCategoryItem(context, "Dining", Icons.dining, ""),
          _buildCategoryItem(context, "Tables", Icons.table_bar, "NEW"),
          _buildCategoryItem(context, "Chairs", Icons.chair, ""),
          _buildCategoryItem(context, "Z Rated", Icons.star_border, ""),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    String title,
    IconData icon,
    String badge,
  ) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Icon(icon, size: 30, color: Colors.blue),
            ),
            if (badge.isNotEmpty)
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: badge == "NEW" ? Colors.green : Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
