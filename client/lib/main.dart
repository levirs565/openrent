import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/bloc/auth.dart';
import 'package:openrent_client/data/address.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/data/message.dart';
import 'package:openrent_client/data/order.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/base.dart';
import 'package:openrent_client/data/rent.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/review.dart';
import 'package:openrent_client/ui/login/page.dart';
import 'package:openrent_client/ui/home.dart';
import 'package:openrent_client/ui/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthDataSource(service: authService),
          dispose: (repository) => repository.dispose(),
        ),
        RepositoryProvider<AddressRepository>(
          create: (_) => AddressDataSource(addressService: addressService),
        ),
        RepositoryProvider<ProductRepository>(
          create: (_) => ProductDataSource(service: productService),
        ),
        RepositoryProvider<ReviewRepository>(
          create: (_) => ReviewDataSource(reviewService: reviewService),
        ),
        RepositoryProvider<LocationRepository>(
          create: (_) =>
              LocationDataSource(locationIQService: locationIQService),
        ),
        RepositoryProvider<RentRepository>(
          create: (_) => RentDataSource(rentService: rentService),
        ),
        RepositoryProvider<RentalRepository>(
          create: (_) => RentalDataSource(rentalService: rentalService),
        ),
        RepositoryProvider<OrderRepository>(
          create: (_) => OrderDataSource(service: orderService),
        ),
        RepositoryProvider<MessageRepository>(
          create: (_) => MessageDataSource(service: messageService),
        ),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) =>
            AuthBloc(authRepository: context.read())..add(AuthBlocEventStart()),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'OpenRent',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state.state is ResourceSuccess) {
              final data =
                  (state.state as ResourceSuccess<AuthUserState?>).data;
              if (data == null) {
                _navigator.pushAndRemoveUntil(LoginPage.route(), (_) => false);
              } else {
                _navigator.pushAndRemoveUntil(HomePage.route(), (_) => false);
              }
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
