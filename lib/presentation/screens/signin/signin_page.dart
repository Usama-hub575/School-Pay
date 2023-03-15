import 'package:paynest_flutter_app/export.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'signIn');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SignInBloc>().add(Initializer());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(25),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                AppBarBackButton(
                  iconColor: AppColors().white,
                  buttonColor: AppColors().primaryColor,
                ),
                const Spacer(),
                Image.asset(
                  AppAssets().welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                const Spacer(),
              ],
            ),
            verticalSpacer(22),
            const BlocUI(),
          ],
        ),
      ),
    );
  }
}
