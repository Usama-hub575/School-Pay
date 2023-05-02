import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emiratesIdController = TextEditingController();
  static GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();

  DateTime tempPickedDate = DateTime.now();
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('en_GB');
    emailController = TextEditingController(
      text: context
          .read<SignInBloc>()
          .state
          .authenticationResponseModel
          .parent
          .email,
    );
    context.read<EditProfileBloc>().add(
          GetName(),
        );
    firstNameController = TextEditingController(
      text: context.read<EditProfileBloc>().state.firstName,
    );
    lastNameController = TextEditingController(
      text: context.read<EditProfileBloc>().state.lastName,
    );
    expiryDateController = TextEditingController(
      text: context
                      .read<SignInBloc>()
                      .state
                      .authenticationResponseModel
                      .parent
                      .expiryDate ==
                  null ||
              context
                  .read<SignInBloc>()
                  .state
                  .authenticationResponseModel
                  .parent
                  .expiryDate
                  .toString()
                  .isEmpty
          ? '-'
          : dateFormat.format(
              DateTime.parse(
                context
                    .read<SignInBloc>()
                    .state
                    .authenticationResponseModel
                    .parent
                    .expiryDate
                    .toString()
                    .substring(0, 10),
              ),
            ),
    );
    emiratesIdController = TextEditingController(
      text: context
                  .read<SignInBloc>()
                  .state
                  .authenticationResponseModel
                  .parent
                  .emiratesId!
                  .length >=
              14
          ? getDashedEmiratesId(
              context
                  .read<SignInBloc>()
                  .state
                  .authenticationResponseModel
                  .parent
                  .emiratesId!,
            )
          : context
              .read<SignInBloc>()
              .state
              .authenticationResponseModel
              .parent
              .emiratesId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      bottom: Radius.circular(
                        24,
                      ),
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
                                editProfile,
                                style: textStyles.bold.copyWith(
                                  color: colors.white,
                                  fontSize: sizes.fontRatio * 18,
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
                                verticalSpacer(16),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(46),
                              boxShadow: [
                                BoxShadow(
                                  color: colors.black.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: const Offset(
                                    1,
                                    1,
                                  ),
                                ),
                              ],
                            ),
                            child: Container(
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
              child: Form(
                key: editProfileFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: verticalValue(30),
                          bottom: verticalValue(16),
                        ),
                        child: Text(
                          accountDetails,
                          style: textStyles.bold.copyWith(
                            color: colors.black,
                            fontSize: sizes.fontRatio * 16,
                          ),
                        ),
                      ),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return CommonTextField(
                            readOnly: state.status == EditProfileStatus.loading
                                ? true
                                : false,
                            onValidate: (value) {},
                            validatorText: requiredText,
                            controller: firstNameController,
                            labelText: firstName,
                            obscureText: false,
                          );
                        },
                      ),
                      verticalSpacer(8),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return CommonTextField(
                            readOnly: state.status == EditProfileStatus.loading
                                ? true
                                : false,
                            onValidate: (value) {},
                            validatorText: requiredText,
                            controller: lastNameController,
                            labelText: lastName,
                            obscureText: false,
                          );
                        },
                      ),
                      verticalSpacer(8),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return CommonTextField(
                            readOnly: state.status == EditProfileStatus.loading
                                ? true
                                : false,
                            onValidate: (value) {},
                            validatorText: requiredText,
                            controller: emailController,
                            labelText: email,
                            obscureText: false,
                          );
                        },
                      ),
                      verticalSpacer(8),
                      BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return InkWellWidget(
                            onTap: () {
                              showDialog(
                                builder: (context) {
                                  return AlertDialog(
                                    title: Row(
                                      children: [
                                        InkWellWidget(
                                          onTap: () {
                                            expiryDateController.text =
                                                dateFormat
                                                    .format(tempPickedDate)
                                                    .toString();
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: verticalValue(25),
                                            width: horizontalValue(70),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: colors.blueAccent,
                                            ),
                                            child: Center(
                                              child: Text(
                                                done,
                                                style: textStyles.semiBold
                                                    .copyWith(
                                                  fontSize:
                                                      sizes.fontRatio * 12,
                                                  color: colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    content: SizedBox(
                                      width: horizontalValue(300),
                                      height: verticalValue(200),
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (DateTime dateTime) {
                                          tempPickedDate = dateTime;
                                        },
                                        initialDateTime: DateTime.parse(
                                          state.authenticationResponseModel
                                              .parent.expiryDate
                                              .toString()
                                              .substring(
                                                0,
                                                10,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                context: context,
                              );
                            },
                            child: CommonTextField(
                              readOnly: true,
                              enabled: false,
                              onValidate: (value) {},
                              controller: expiryDateController,
                              labelText: expiry,
                              obscureText: false,
                              validatorText: requiredText,
                            ),
                          );
                        },
                      ),
                      verticalSpacer(8),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return CommonTextField(
                            readOnly: state.status == EditProfileStatus.loading
                                ? true
                                : false,
                            onValidate: (value) {},
                            controller: emiratesIdController,
                            labelText: emiratesID,
                            obscureText: false,
                            inputFormatters: [
                              EmiratesIdFormatter(
                                mask: 'xxx-xxxx-xxxxxxx-x',
                                separator: '-',
                              )
                            ],
                          );
                        },
                      ),
                      verticalSpacer(70),
                      SizedBox(
                        width: double.infinity,
                        height: sizes.heightRatio * 46,
                        child: BlocConsumer<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            return ElevatedButtons(
                              textColor: colors.white,
                              text: updateProfile,
                              isLoading:
                                  state.status == EditProfileStatus.loading
                                      ? true
                                      : false,
                              color: colors.primaryColor,
                              onPressed: () {
                                if (editProfileFormKey.currentState!
                                    .validate()) {
                                  context.read<EditProfileBloc>().add(
                                        EditProfileLoading(),
                                      );
                                  context.read<EditProfileBloc>().add(
                                        EditProfileOnPressed(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                          expiryDate: tempPickedDate.toString(),
                                          emiratesID: emiratesIdController.text
                                              .toString()
                                              .replaceAll(
                                                '-',
                                                '',
                                              ),
                                        ),
                                      );
                                }
                              },
                            );
                          },
                          listener: (context, state) {
                            switch (state.status) {
                              case EditProfileStatus.init:
                                break;
                              case EditProfileStatus.loading:
                                break;
                              case EditProfileStatus.success:
                                Navigator.pop(context, true);
                                showToast(
                                  message: state.successMessage,
                                  context: context,
                                  color: colors.primaryColor,
                                );
                                break;
                              case EditProfileStatus.error:
                                showToast(
                                  message: state.errorMessage,
                                  context: context,
                                  color: colors.redShade3,
                                );
                                break;
                              case EditProfileStatus.loaded:
                                // TODO: Handle this case.
                                break;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
