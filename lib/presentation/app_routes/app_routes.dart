import 'package:paynest_flutter_app/export.dart';

class AppRoutes {
  static const initializer = '/';
  static const navigateToWelcome = '/welcome';
  static const navigateToRegister = '/register';
  static const navigateToDashboard = '/dashboard';
  static const navigateToForgotPassword = '/forgotPassword';
  static const navigateToNewPassword = '/newPassword';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _currentRoute = settings.name;
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case initializer:
        return MaterialPageRoute(
          builder: (_) => const InitializerPage(),
        );
      case navigateToWelcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );
      case navigateToRegister:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case navigateToDashboard:
        return MaterialPageRoute(
          builder: (_) => const HostPage(),
        );
      case navigateToForgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
        );
      case navigateToNewPassword:
        return MaterialPageRoute(
          builder: (_) => NewPassword(
            email: args?['email'],
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static bool isCurrent(String newRoute) {
    return newRoute == _currentRoute;
  }

  static String? _currentRoute;

  static void setCurrent(String route) {
    _currentRoute = route;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
