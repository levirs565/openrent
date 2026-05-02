import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:openrent_client/bloc/auth.dart';
import 'package:openrent_client/data/address.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/chat.dart';
import 'package:openrent_client/data/exchange_rates.dart';
import 'package:openrent_client/data/local/settings.dart';
import 'package:openrent_client/data/location.dart';
import 'package:openrent_client/data/message.dart';
import 'package:openrent_client/data/order.dart';
import 'package:openrent_client/data/product.dart';
import 'package:openrent_client/data/remote/base.dart';
import 'package:openrent_client/data/remote/exchange_rate.dart';
import 'package:openrent_client/data/remote/user.dart';
import 'package:openrent_client/data/rent.dart';
import 'package:openrent_client/data/rental.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/data/review.dart';
import 'package:openrent_client/data/settings.dart';
import 'package:openrent_client/data/user.dart';
import 'package:openrent_client/ui/biometric_failed.dart';
import 'package:openrent_client/ui/home.dart';
import 'package:openrent_client/ui/login/page.dart';
import 'package:openrent_client/ui/splash.dart';

import 'data/remote/address.dart';
import 'data/remote/auth.dart';
import 'data/remote/chat.dart';
import 'data/remote/locationiq.dart';
import 'data/remote/message.dart';
import 'data/remote/order.dart';
import 'data/remote/product.dart';
import 'data/remote/rent.dart';
import 'data/remote/rental.dart';
import 'data/remote/review.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission(provisional: true);

  await openSettingsBox();

  final dioInstance = await createRemoteDio();
  final authService = AuthService(dioInstance);
  final addressService = AddressService(dioInstance);
  final productService = ProductService(dioInstance);
  final reviewService = ReviewService(dioInstance);
  final rentService = RentService(dioInstance);
  final rentalService = RentalService(dioInstance);
  final orderService = OrderService(dioInstance);
  final messageService = MessageService(dioInstance);
  final chatService = ChatService(dioInstance);
  final userService = UserService(dioInstance);
  final exchangeRateService = ExchangeRateService(dioInstance);
  final locationIQService = LocationIQService(Dio());

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) =>
              AuthDataSource(service: authService, dioUploaded: Dio()),
          dispose: (repository) => repository.dispose(),
        ),
        RepositoryProvider<AddressRepository>(
          create: (_) => AddressDataSource(addressService: addressService),
        ),
        RepositoryProvider<ProductRepository>(
          create: (_) =>
              ProductDataSource(service: productService, dioUploader: Dio()),
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
        RepositoryProvider<ChatRepository>(
          create: (_) => ChatDataSource(chatService: chatService),
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => UserDataSource(service: userService),
        ),
        RepositoryProvider<ExchangeRatesRepository>(
          create: (_) =>
              ExchangeRatesDataSource(exchangeRateService: exchangeRateService),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (_) => SettingsDataSource(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => AuthBloc(
        authRepository: context.read(),
        settingsRepository: context.read(),
      )..add(AuthBlocEventStart()),
      child: AppView(),
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
          listenWhen: (prev, curr) =>
              prev.state.runtimeType != curr.state.runtimeType ||
              (prev.state is AuthStateSuccess &&
                  curr.state is AuthStateSuccess &&
                  (prev.state as AuthStateSuccess).user?.id !=
                      (curr.state as AuthStateSuccess).user?.id),
          listener: (context, state) {
            if (state.state is AuthStateSuccess) {
              final data = (state.state as AuthStateSuccess).user;
              if (data == null) {
                _navigator.pushAndRemoveUntil(LoginPage.route(), (_) => false);
              } else {
                _navigator.pushAndRemoveUntil(HomePage.route(), (_) => false);
              }
            } else if (state.state is AuthStateBiometricFailed) {
              _navigator.pushAndRemoveUntil(
                BiometricFailedPage.route(),
                (_) => false,
              );
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
