import 'package:flutter/material.dart';
import 'package:flutter_app/features/products/presentation/widgets/product_list_item.dart';
import 'package:flutter_app/providers/controller_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataValue = ref.watch(productListControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: dataValue.when(
          data: (data) {
            return GridView.count(
              crossAxisCount: 2,
              children: data
                  .map((product) => ProductListItem(product: product))
                  .toList(),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString())),
    );
  }
}
