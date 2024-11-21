// main.dart
import 'package:ecommerce_front/controllers/category_controller.dart';
import 'package:ecommerce_front/controllers/login_controller.dart';
import 'package:ecommerce_front/controllers/role_controller.dart';
import 'package:ecommerce_front/controllers/subcategory_controller.dart';
import 'package:ecommerce_front/controllers/user_controller.dart';
import 'package:ecommerce_front/screens/login_screen.dart';
import 'package:ecommerce_front/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/product_controller.dart'; // Importa o ProductController para gerenciar o estado dos produtos
import 'screens/product_list_screen.dart'; // Define a ProductListScreen como tela inicial

void main() {
  // Inicia o app com MultiProvider para gerenciar múltiplos controladores de estado
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ProductController()), // Inicia o ProductController como provedor de estado
        ChangeNotifierProvider(create: (_) => CategoryController()),
        ChangeNotifierProvider(create: (_) => SubCategoryController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => RoleController()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor padrão do tema
      ),
      home: LoginScreen(), // Define a tela inicial como ProductListScreen
    );
  }
}
