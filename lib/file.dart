import 'dart:io';

void main() {
  final directories = [
    'lib/core/constants',
    'lib/core/utils',
    'lib/core/widgets',
    'lib/core/theme',
    'lib/core/routes',

    'lib/features/auth/data',
    'lib/features/auth/providers',
    'lib/features/auth/repository',
    'lib/features/auth/view',
    'lib/features/auth/widgets',

    'lib/features/customer/data',
    'lib/features/customer/providers',
    'lib/features/customer/repository',
    'lib/features/customer/view',
    'lib/features/customer/widgets',

    'lib/features/supplier/data',
    'lib/features/supplier/providers',
    'lib/features/supplier/repository',
    'lib/features/supplier/view',
    'lib/features/supplier/widgets',

    'lib/features/admin/data',
    'lib/features/admin/providers',
    'lib/features/admin/repository',
    'lib/features/admin/view',
    'lib/features/admin/widgets',

    'lib/services/api',
    'lib/services/local_storage',
    'lib/services/notifications',

    'lib/models',
  ];

  final files = {
    'lib/main.dart': mainTemplate,
    'lib/core/routes/app_routes.dart': routesTemplate,
    'lib/services/auth_service.dart': '// TODO: Implement AuthService',
    'lib/models/user_model.dart': userModelTemplate,
    'lib/models/product_model.dart': productModelTemplate,
    'lib/models/order_model.dart': orderModelTemplate,
  };

  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
  }

  files.forEach((path, content) {
    File(path).writeAsStringSync(content);
  });

  print('✅ Project structure created successfully with Riverpod setup!');
}

const mainTemplate = '''
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contraceptive Store',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
''';

const routesTemplate = '''
import 'package:flutter/material.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Placeholder(), // TODO: Replace with SplashScreen
    login: (context) => const Placeholder(),  // TODO: Replace with LoginScreen
    dashboard: (context) => const Placeholder(), // TODO: Replace with DashboardScreen
  };
}
''';

const userModelTemplate = '''
class UserModel {
  final String id;
  final String name;
  final String email;
  final String role; // customer, supplier, admin
  final bool verified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.verified = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        verified: json['verified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
        'verified': verified,
      };
}
''';

const productModelTemplate = '''
class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String supplierId;
  final int stockQuantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.supplierId,
    required this.stockQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        supplierId: json['supplierId'],
        stockQuantity: json['stockQuantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'price': price,
        'imageUrl': imageUrl,
        'supplierId': supplierId,
        'stockQuantity': stockQuantity,
      };
}
''';

const orderModelTemplate = '''
class OrderModel {
  final String id;
  final String customerId;
  final String supplierId;
  final String productId;
  final int quantity;
  final double totalPrice;
  final String status; // pending, approved, shipped, delivered

  OrderModel({
    required this.id,
    required this.customerId,
    required this.supplierId,
    required this.productId,
    required this.quantity,
    required this.totalPrice,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        customerId: json['customerId'],
        supplierId: json['supplierId'],
        productId: json['productId'],
        quantity: json['quantity'],
        totalPrice: json['totalPrice'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customerId': customerId,
        'supplierId': supplierId,
        'productId': productId,
        'quantity': quantity,
        'totalPrice': totalPrice,
        'status': status,
      };
}
''';
