import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';

class PendingTask extends StatefulWidget {
  const PendingTask({Key? key}) : super(key: key);

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // BlocBuilder<SignInBloc, SignInState>(
          //   builder: (context, state) {
          //     return state.authenticationResponseModel.parent.pin == null
          //         ? Container(
          //             height: verticalValue(129),
          //             decoration: BoxDecoration(
          //               color: colors.primaryColor,
          //               borderRadius: const BorderRadius.vertical(
          //                 bottom: Radius.circular(24),
          //               ),
          //             ),
          //             child: SafeArea(
          //               child: Padding(
          //                 padding: EdgeInsets.only(
          //                   left: horizontalValue(
          //                     25,
          //                   ),
          //                 ),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Row(
          //                       children: [
          //                         Padding(
          //                           padding: EdgeInsets.only(
          //                             right: horizontalValue(25),
          //                           ),
          //                           child: Container(
          //                             height: verticalValue(44),
          //                             width: horizontalValue(44),
          //                             decoration: BoxDecoration(
          //                               boxShadow: [
          //                                 BoxShadow(
          //                                   color: colors.lightGreyShade4,
          //                                   blurRadius: 2.0,
          //                                   offset: const Offset(
          //                                     3.0, // Move to right 10  horizontally
          //                                     3.0, // Move to bottom 10 Vertically
          //                                   ),
          //                                 ),
          //                               ],
          //                               color: colors.white,
          //                               borderRadius: BorderRadius.circular(12),
          //                             ),
          //                             child: IconButton(
          //                               onPressed: () {
          //                                 Navigator.pop(context);
          //                               },
          //                               icon: Icon(
          //                                 Icons.arrow_back,
          //                                 size: 20,
          //                                 color: colors.primaryColor,
          //                               ),
          //                               // child: Text(""),
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           pendingTask,
          //                           textAlign: TextAlign.center,
          //                           style: textStyles.bold.copyWith(
          //                             color: colors.white,
          //                             fontSize: sizes.fontRatio * 20,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           )
          //         : const SizedBox.shrink();
          //   },
          // ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return state.authenticationResponseModel.parent.pin == null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: verticalValue(16),
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ChangePIN(),
                                ),
                              );
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecentTrasactionPage()));
                            },
                            title: Text(
                              setPIN,
                              style: textStyles.bold.copyWith(
                                color: colors.black,
                                fontSize: sizes.fontRatio * 16,
                              ),
                            ),
                            trailing: SvgPicture.asset(
                              assets.arrowNext,
                            ),
                            subtitle: Text(
                              youNeedToSetUpPin,
                              style: textStyles.bold.copyWith(
                                color: colors.textGrey,
                                fontSize: sizes.fontRatio * 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: verticalValue(16),
                          ),
                        ],
                      ),
                    )
                  : NoDataFound(
                      showLogo: true,
                      showIconButton: true,
                      showElevatedButton: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
