import 'package:flutter_ecommerce/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:flutter_ecommerce/features/shop/models/product_variation_model.dart';
import 'package:flutter_ecommerce/routes/routes.dart';
import 'package:flutter_ecommerce/utils/constants/image_strings.dart';

import 'features/shop/models/banner_model.dart';
import 'features/shop/models/category_model.dart';
import 'features/shop/models/product_model.dart';

class TDummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.promoBanner3,
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner1,
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner2,
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner4,
        targetScreen: TRoutes.order,
        active: false),
  ];

  /// List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.shoeIcon, name: 'Sports', isFeatured: true),
    CategoryModel(
        id: '2', image: TImages.shoeIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(
        id: '3',
        image: TImages.shoeIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '4', image: TImages.shoeIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '5', image: TImages.shoeIcon, name: 'Animals', isFeatured: true),
    CategoryModel(
        id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7', image: TImages.shoeIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(
        id: '14', image: TImages.shoeIcon, name: 'Jewelery', isFeatured: true),
  ];

  /// List of all products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 135,
        thumbnail: TImages.nikeRed,
        isFeatured: true,
        description: 'Green Nike sports shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeIcon,
            productsCount: 265,
            isFeatured: true,
            name: 'Nike'),
        images: [
          TImages.nikeRed,
          TImages.nikeBlue,
          TImages.nikeRed,
          TImages.nikeBlue
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.nikeRed,
              description:
                  'This is the Product description for Green Nike sports shoe.',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.nikeBlue,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.nikeRed,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.nikeBlue,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.nikeRed,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.nikeRed,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ],
      productType: 'ProductType.variable',
    ),
  ];
}
