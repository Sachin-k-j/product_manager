import 'package:flutter/material.dart';
import 'package:product_mngr/helper/helpers.dart';

import '../data/model/model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextFormatter.reduceTextLength(product.title, 30),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  TextFormatter.reduceTextLength(product.description, 78),
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "\$${TextFormatter.formatCurrency.format(product.price)}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                    children: List.generate(
                        product.rating.round(),
                        (index) => const Icon(
                              Icons.star_rate,
                              size: 12,
                              color: Colors.amber,
                            )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
