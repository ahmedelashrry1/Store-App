// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store_app/screens/update_prodect.dart';

class Product {
  final String title;
  final List<String> images;
  final dynamic price;
  final bool isFavourite;
  final List<Color> colors;

    Product({
      required this.title,
      required this.images,
      required this.price,
      required this.colors,
      this.isFavourite = false,
    });
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.5,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 210.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Color(0xff8AAE92).withOpacity(0.1),
              spreadRadius: 0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => details_product(
                  product: product,
                ),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 150,
                    ),
                    child: AspectRatio(
                      aspectRatio: aspectRetio,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Positioned(
                            right: 25,
                            top: -30,
                            child: Image.network(
                              product.images[0],
                              height: 130,
                              width: 130,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color(0xff8AAE92),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // وظيفة عند الضغط على أيقونة عربة التسوق
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.grey,
                              size: 24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // وظيفة عند الضغط على أيقونة القلب
                            },
                            icon: Icon(
                              product.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: product.isFavourite
                                  ? Colors.red
                                  : Colors.grey,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  }