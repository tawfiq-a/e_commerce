class ProductData {
  final int id;
  final String name;
  final String? extraNote;
  final String? category;
  final Brand? brand;
  final String? description;
  final String price;
  final List<String> images;
  final String? sizes;
  final String? averageRating;
  final int? totalReviews;
  final DateTime? createdAt;
  final List<int>? wishers;

  ProductData({
    required this.id,
    required this.name,
    this.extraNote,
    this.category,
    this.brand,
    this.description,
    required this.price,
    required this.images,
    this.sizes,
    this.averageRating,
    this.totalReviews,
    this.createdAt,
    this.wishers,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      name: json['name'] ?? '',
      extraNote: json['extra_note'],
      category: json['category'],
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      description: json['description'],
      price: json['price'] ?? '0.0',
      images: List<String>.from(json['images'] ?? []),
      sizes: json['sizes'],
      averageRating: json['average_rating']?.toString(),
      totalReviews: json['total_reviews'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      wishers: json['wishers'] != null
          ? List<int>.from(json['wishers'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'extra_note': extraNote,
      'category': category,
      'brand': brand?.toJson(),
      'description': description,
      'price': price,
      'images': images,
      'sizes': sizes,
      'average_rating': averageRating,
      'total_reviews': totalReviews,
      'created_at': createdAt?.toIso8601String(),
      'wishers': wishers,
    };
  }
}

class Brand {
  final int id;
  final String name;
  final String brandImage;

  Brand({
    required this.id,
    required this.name,
    required this.brandImage,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'] ?? '',
      brandImage: json['brand_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand_image': brandImage,
    };
  }
}