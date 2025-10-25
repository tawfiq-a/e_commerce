
import 'package:flutter/widgets.dart';

class Product {
 
  final String id;
  final String name;
  final String price;
  final Image image;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}