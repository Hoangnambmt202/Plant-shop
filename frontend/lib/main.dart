import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/ui/root_page.dart';
import 'package:frontend/ui/screens/signin_page.dart';
import 'package:frontend/ui/onboarding_screen.dart';
import 'package:frontend/ui/screens/cart_page.dart';
import 'package:frontend/ui/screens/checkout_page.dart';
import 'package:frontend/ui/screens/bank_payment_page.dart';
import 'package:frontend/ui/screens/checkout_success_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Plant Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/signin',
      routes: {
        '/onboardingscreen': (context) => const OnboardingScreen(),
        '/main': (context) => const RootPage(),
        '/signin': (context) => const SignIn(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/bank-payment': (context) => const BankPaymentPage(),
        '/checkout-success': (context) => const CheckoutSuccessPage(),
      },
    );
  }
}
