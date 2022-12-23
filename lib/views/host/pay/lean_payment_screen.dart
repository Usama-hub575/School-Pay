import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lean_sdk_flutter/lean_sdk_flutter.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../widgets/back_button.dart';

class LeanPaymentScreen extends StatefulWidget {
  const LeanPaymentScreen({Key? key}) : super(key: key);

  @override
  State<LeanPaymentScreen> createState() => _LeanPaymentScreenState();
}

class _LeanPaymentScreenState extends State<LeanPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var appToken = "535ecdd5-c4a2-4c7d-bb70-255df92ab047";
    var customerId = "4783b73e-a299-423e-a9a1-d0bc4bcb638c";
    var reconnectId = "";
    var paymentDestinationId = "";
    var paymentIntentId = "";
    var permissions = [
      Permission.identity,
      Permission.transactions,
      Permission.balance,
      Permission.accounts
    ];
    var isSandbox = true;

    _connect() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.red,
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Lean.connect(
                appToken: appToken,
                customerId: customerId,
                permissions: permissions,
                isSandbox: isSandbox,
                callback: (resp) {
                  if (kDebugMode) {
                    print("Callback: $resp");
                  }
                  Navigator.pop(context);
                },
                actionCancelled: () => Navigator.pop(context),
              ),
            );
          });
    }

    _createPaymentSource() {
      showDialog(
          context: context,
          builder: (BuildContext context) => Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Lean.createPaymentSource(
                appToken: appToken,
                customerId: customerId,
                isSandbox: isSandbox,
                callback: (resp) {
                  if (kDebugMode) {
                    print("Callback: $resp");
                  }
                  Navigator.pop(context);
                },
                actionCancelled: () => Navigator.pop(context),
              ),
            ),
          ));
    }

    _reconnect() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Lean.reconnect(
          appToken: appToken,
          reconnectId: reconnectId,
          isSandbox: isSandbox,
          callback: (resp) {
            if (kDebugMode) {
              print("Callback: $resp");
            }
            Navigator.pop(context);
          },
          actionCancelled: () => Navigator.pop(context),
        ),),
      );
    }

    _pay() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.red,
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Lean.pay(
                appToken: appToken,
                paymentIntentId: paymentIntentId,
                isSandbox: isSandbox,
                callback: (resp) {
                  if (kDebugMode) {
                    print("Callback: $resp");
                  }
                  Navigator.pop(context);
                },
                actionCancelled: () => Navigator.pop(context),
              ),
            );
          });
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 129.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                  ),
                  decoration: BoxDecoration(
                    color: PayNestTheme.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24.r),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        verticalSpacer(16),
                        Row(
                          children: [
                            AppBarBackButton(
                              iconColor: PayNestTheme.primaryColor,
                              buttonColor: PayNestTheme.colorWhite,
                            ),
                            horizontalSpacer(40),
                            Text(
                              "LEAN PAYMENT",
                              style: PayNestTheme.title20white.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'montserratBold',
                                fontSize: sizes.fontRatio * 18,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/welcome_register_logo.png',
                        width: 100, height: 100),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _connect(),
                      style: _buttonStyle(),
                      child: const Text('Connect'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _createPaymentSource(),
                      style: _buttonStyle(),
                      child: const Text('Create payment source'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _reconnect(),
                      style: _buttonStyle(),
                      child: const Text('Reconnect'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pay(),
                      style: _buttonStyle(),
                      child: const Text('Pay'),
                    ),
                  ],
                ),
              ],
            )));
  }

  _buttonStyle() => ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    primary: Colors.black,
    minimumSize: const Size(200, 40),
    maximumSize: const Size(200, 40),
  );
}
