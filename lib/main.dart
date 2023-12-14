import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/brand_bloc/brand_bloc.dart';
import 'blocs/checkout_bloc/checkout_bloc.dart';
import 'blocs/login_bloc/login_bloc.dart';
import 'blocs/order_bloc/order_bloc.dart';
import 'blocs/product_bloc/product_bloc.dart';
import 'blocs/register_bloc/register_bloc.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/brand_repository.dart';
import 'data/repositories/order_repository.dart';
import 'data/repositories/product_repository.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/auth_service.dart';
import 'data/services/brand_service.dart';
import 'data/services/db_service.dart';
import 'data/services/order_service.dart';
import 'data/services/product_service.dart';
import 'data/services/user_service.dart';
import 'ui/screens/main_navigation_screen/main_navigation_screen.dart';
import 'ui/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            authService: AuthService(),
            dbService: DBService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            userService: UserService(),
            dbService: DBService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(
            productService: ProductService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => BrandRepository(
            brandService: BrandService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => OrderRepository(
            orderService: OrderService(),
            dbService: DBService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(AppStarted()),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
              authRepository: context.read<AuthRepository>(),
              authBloc: context.read<AuthBloc>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              authRepository: context.read<AuthRepository>(),
              authBloc: context.read<AuthBloc>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              productRepository: context.read<ProductRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => BrandBloc(
              brandRepository: context.read<BrandRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(),
          ),
          BlocProvider(
            create: (context) => OrderBloc(
              orderRepository: context.read<OrderRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce',
          theme: MyTheme.theme,
          home: const MainNavigationScreen(),
        ),
      ),
    );
  }
}
