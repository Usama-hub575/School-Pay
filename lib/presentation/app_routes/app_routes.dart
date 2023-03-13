import 'package:paynest_flutter_app/export.dart';

class AppRoutes {
  static const initializer = '/';
  static const navigateToWelcome = '/welcome';
  static const navigateToSignIn = '/signIn';
  static const navigateToRegister = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _currentRoute = settings.name;
    // Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case initializer:
        return MaterialPageRoute(
          builder: (_) => InitializerPage(),
        );
      case navigateToWelcome:
        return MaterialPageRoute(
          builder: (_) => WelcomePage(),
        );
      case navigateToSignIn:
        return MaterialPageRoute(
          builder: (_) => SignInPage(),
        );
      case navigateToRegister:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
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
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
