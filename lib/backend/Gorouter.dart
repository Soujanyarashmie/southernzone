import 'package:go_router/go_router.dart';
import 'package:southern_zone/pages/Homepage.dart';
import 'package:southern_zone/pages/Login_page.dart';
import 'package:southern_zone/pages/Otp_verification.dart';
import 'package:southern_zone/pages/forgot_pass.dart';
import 'package:southern_zone/pages/logins_splash.dart';
import 'package:southern_zone/pages/profile.dart';
import 'package:southern_zone/pages/signuppage.dart';
import 'package:southern_zone/pages/splashscreen.dart';
import 'package:southern_zone/pages/viewproperty.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/LoginSplash',
      builder: (context, state) => const LoginSplash(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/forgotpassword',
      builder: (context, state) => const ForgetPasswordPage(),
    ),
    GoRoute(
      path: '/Homepage',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/Profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/viewproperty',
      builder: (context, state) => PropertyPurchaseFlow(),
    ),
     GoRoute(
      path: '/Signup',
      builder: (context, state) =>SignUpScreen(),
    ),
    GoRoute(
      path: '/Otp',
      builder: (context, state) =>OTPVerificationPage(),
    ),
  ],
);
