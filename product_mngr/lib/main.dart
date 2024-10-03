import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_mngr/product/bloc/product_bloc.dart';
import 'package:product_mngr/product/data/repository/product_repository.dart';
import 'package:product_mngr/product/screens/products_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc API',
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
            data: mediaQueryData.copyWith(
                textScaler: const TextScaler.linear(1.0)),
            child: child!);
      },
      theme: ThemeData(useMaterial3: true),
      home: RepositoryProvider<ProductRepository>(
        create: (context) => ProductRepository(),
        child: BlocProvider(
          lazy: false,
          create: (context) =>
              ProductBloc(productRepository: context.read<ProductRepository>()),
          child: const ProductsPage(),
        ),
      ),
    );
  }
}
