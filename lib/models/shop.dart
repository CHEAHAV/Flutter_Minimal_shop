import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: "The Stentor",
      price: 59.99,
      description:
          "he Stentor exudes classic style with a modern twist. Featuring a teardrop crown and an elegant double-bow hatband, this light camel fedora is perfect for the fashion-conscious man who seeks versatility and sophistication.",
      imagePath: 'assets/images/hate.png',
    ),
    Product(
      name: "Women Sweatshirt",
      price: 44.99,
      description:
          "This darling design is just for our Little Women fans. The ladies are all dressed up and ready to attract your people. Wear this cozy sweatshirt to start conversations about your favorite topics: books, Louisa May Alcott, Jo March, the Little Women movies, and everything feminine. Makes a perfect gift for book lovers.",
      imagePath: 'assets/images/shirt.png',
    ),
    Product(
      name: "Reading Glasses",
      price: 45.49,
      description:
          "Enhance your style and reading experience with the Kocolior Unisex Full Rim Square Acetate Hyperopic Reading Glasses 4913. These premium glasses are designed with both fashion and function in mind, making them perfect for both men and women.",
      imagePath: 'assets/images/glass.png',
    ),
    Product(
      name: "Men's Retro Corduroy Shirt",
      price: 69.99,
      description:
          "Product information: Pattern: solid color Color: light blue, gray, apricot, brown, dark blue Suitable for people: Youth Size: M,L,XL,XXL,XXXL Fabric name: Cotton Main fabric composition.",
      imagePath: 'assets/images/man_shirt.png',
    ),
    Product(
      name: "Men's Slim Fit",
      price: 37.99,
      description:
          "Free Returns ✓ Free Shipping✓. Men's Slim Fit Lightweight Zipper Up Casual Jacket- Men Jackets & Coats at SHEIN.",
      imagePath: 'assets/images/t_shirt.png',
    ),
    Product(
      name: "Daniel | Mocassins",
      price: 77.77,
      description:
          "Les journées d'été appellent à une élégance sans effort. Imaginez-vous profiter des journées ensoleillées, avec un look impeccable et un confort inégalé à chaque pas. Avec les mocassins d'été Daniel, chaque promenade devient une expérience de luxe et de raffinement. Cessez dimaginer, cela peut devenir votre réalité.",
      imagePath: 'assets/images/shoe.png',
    ),
    Product(
      name: "Dual-Shoulder Bag",
      price: 49.49,
      description:
          "Casual Oxford Cloth Dual-Shoulder Bag Pure Color Ladies Backpack Canvas Small Size Bookbag Zipper",
      imagePath: 'assets/images/bag.png',
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user card
  List<Product> get cart => _cart;

  // add item to card
  void addToCard(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from card
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
