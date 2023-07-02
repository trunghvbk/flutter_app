import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/products/domain/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(product.title),
        Text('${product.availableQuantity}'),
        Text('${product.price}')
      ],
    );
  }
}
