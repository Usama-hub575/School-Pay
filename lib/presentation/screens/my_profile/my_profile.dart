import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController passwordController = TextEditingController();
  late DateFormat dateFormat;

  @override
  void initState() {
    initializeDateFormatting();
    context.read<EditProfileBloc>().add(
          GetName(),
        );
    dateFormat = DateFormat.yMMMMd('en_GB');
    passwordController.text = '********';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: verticalValue(240),
            child: Stack(
              children: [
                Container(
                  height: verticalValue(172),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: horizontalValue(25),
                        top: verticalValue(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppBarBackButton(
                                iconColor: colors.primaryColor,
                                buttonColor: colors.white,
                              ),
                              horizontalSpacer(50),
                              Text(
                                myProfile,
                                style: textStyles.bold.copyWith(
                                  color: colors.white,
                                  fontSize: sizes.fontRatio * 18,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: horizontalValue(25),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: colors.lightGreyShade4,
                                        blurRadius: 2.0,
                                        offset: const Offset(
                                          3.0, // Move to right 10  horizontally
                                          3.0, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                    ],
                                    color: colors.white,
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  child: BlocBuilder<EditProfileBloc,
                                          EditProfileState>(
                                      builder: (context, state) {
                                    return IconButton(
                                      onPressed: () async {
                                        final value =
                                            await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EditProfilePage(),
                                          ),
                                        );
                                        if (value as bool) {
                                          context.read<EditProfileBloc>().add(
                                                EditProfileLoading(),
                                              );
                                          context.read<EditProfileBloc>().add(
                                                GetName(),
                                              );
                                          context.read<EditProfileBloc>().add(
                                                EditProfileLoaded(),
                                              );
                                        }
                                      },
                                      padding: EdgeInsets.zero,
                                      icon: Lottie.asset(
                                        assets.editAnimation,
                                        repeat: true,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: verticalValue(100),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(24),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: horizontalValue(25),
                            right: horizontalValue(25),
                            top: verticalValue(30),
                          ),
                          child: Container(
                            width: horizontalValue(250),
                            height: verticalValue(100),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: colors.dropShadow.withOpacity(
                                    .3,
                                  ),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: const Offset(
                                    0,
                                    5,
                                  ),
                                ),
                              ],
                              color: colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // verticalSpacer(10),
                                BlocBuilder<EditProfileBloc, EditProfileState>(
                                  builder: (context, state) {
                                    return Text(
                                      "${state.firstName} ${state.lastName}",
                                      style: textStyles.bold.copyWith(
                                        fontSize: sizes.fontRatio * 18,
                                        color: colors.black,
                                      ),
                                    );
                                  },
                                ),
                                verticalSpacer(20),
                              ],
                            ),
                          ),
                        ),
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return Positioned(
                              top: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(46),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 18,
                                      offset: const Offset(
                                        1,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: state.authenticationResponseModel.parent
                                                .profileImage ==
                                            null &&
                                        state.authenticationResponseModel.parent
                                                .profileImage !=
                                            ""
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          state.authenticationResponseModel
                                                  .parent.profileImage ??
                                              '',
                                        ),
                                      )
                                    : Container(
                                        height: verticalValue(80),
                                        width: verticalValue(80),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          assets.icMale,
                                        ),
                                      ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                  vertical: verticalValue(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(20),
                    Text(
                      accountDetails,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    verticalSpacer(16),
                    Text(
                      fullName,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    BlocBuilder<EditProfileBloc, EditProfileState>(
                      builder: (context, state) {
                        return Text(
                          "${state.firstName} ${state.lastName}",
                          style: textStyles.semiBold.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: colors.lightGreyShade,
                          ),
                        );
                      },
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(12),
                    Text(
                      email,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return Text(
                          state.authenticationResponseModel.parent.email ?? '',
                          style: textStyles.semiBold.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: colors.lightGreyShade,
                          ),
                        );
                      },
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(12),
                    Text(
                      phoneNumber,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                      return Text(
                        '${state.authenticationResponseModel.parent.dialCode} ${state.authenticationResponseModel.parent.phone}',
                        style: textStyles.semiBold.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: colors.lightGreyShade,
                        ),
                      );
                    }),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(12),
                    Text(
                      emiratesID,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      children: [
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return Text(
                              (state.authenticationResponseModel.parent
                                              .emiratesId?.length ??
                                          0) >=
                                      14
                                  ? getDashedEmiratesId(
                                      state.authenticationResponseModel.parent
                                              .emiratesId ??
                                          '',
                                    )
                                  : state.authenticationResponseModel.parent
                                          .emiratesId ??
                                      '',
                              style: textStyles.semiBold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: colors.lightGreyShade,
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        Text(
                          optional,
                          style: textStyles.bold.copyWith(
                            color: colors.primaryColor.withOpacity(0.5),
                            fontSize: sizes.fontRatio * 8,
                          ),
                        ),
                        horizontalSpacer(8),
                      ],
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(12),
                    Text(
                      expiry,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      children: [
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return Text(
                              state.authenticationResponseModel.parent
                                              .expiryDate ==
                                          null ||
                                      state.authenticationResponseModel.parent
                                          .expiryDate!.isEmpty
                                  ? '-'
                                  : dateFormat.format(
                                      DateTime.parse(
                                        state.authenticationResponseModel.parent
                                            .expiryDate
                                            .toString()
                                            .substring(0, 10),
                                      ),
                                    ),
                              style: textStyles.semiBold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: colors.lightGreyShade,
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        Text(
                          optional,
                          style: textStyles.bold.copyWith(
                            color: colors.primaryColor.withOpacity(0.5),
                            fontSize: sizes.fontRatio * 8,
                          ),
                        ),
                        horizontalSpacer(8),
                      ],
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(12),
                    Text(
                      passportNumber,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      children: [
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return Text(
                              state.authenticationResponseModel.parent
                                      .passport ??
                                  '',
                              style: textStyles.semiBold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: colors.lightGreyShade,
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        Text(
                          optional,
                          style: textStyles.bold.copyWith(
                            color: colors.primaryColor.withOpacity(0.5),
                            fontSize: sizes.fontRatio * 8,
                          ),
                        ),
                        horizontalSpacer(8),
                      ],
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(12),
                    Text(
                      expiry,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      children: [
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return Text(
                              state.authenticationResponseModel.parent
                                              .expiryDate ==
                                          null ||
                                      state.authenticationResponseModel.parent
                                          .expiryDate!.isEmpty
                                  ? '-'
                                  : dateFormat.format(
                                      DateTime.parse(
                                        state.authenticationResponseModel.parent
                                            .expiryDate
                                            .toString()
                                            .substring(0, 10),
                                      ),
                                    ),
                              style: textStyles.semiBold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: colors.lightGreyShade,
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        Text(
                          optional,
                          style: textStyles.bold.copyWith(
                            color: colors.primaryColor.withOpacity(0.5),
                            fontSize: sizes.fontRatio * 8,
                          ),
                        ),
                        horizontalSpacer(8),
                      ],
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(16),
                    Text(
                      passwordDetail,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    verticalSpacer(8),
                    Text(
                      password,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '*******',
                          style: textStyles.semiBold.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: colors.lightGreyShade,
                          ),
                        ),
                        SvgPicture.asset(
                          assets.icEyeCrossed,
                          color: colors.primaryColor,
                        ),
                      ],
                    ),
                    verticalSpacer(8),
                    Container(
                      height: verticalValue(1),
                      color: colors.greyLite5,
                    ),
                    verticalSpacer(16),
                    SizedBox(
                      width: double.infinity,
                      height: sizes.heightRatio * 46,
                      child: ElevatedButtons(
                        textColor: colors.white,
                        text: changePassword,
                        isLoading: false,
                        color: colors.primaryColor,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChangePassword(),
                            ),
                          );
                        },
                      ),
                    ),
                    verticalSpacer(16),
                    SizedBox(
                      width: double.infinity,
                      height: sizes.heightRatio * 46,
                      child: ElevatedButtons(
                        color: colors.redShade3,
                        isLoading: false,
                        text: deleteAccount,
                        textColor: colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
