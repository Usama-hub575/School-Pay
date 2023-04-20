import 'package:paynest_flutter_app/export.dart';

class AddStudent extends StatefulWidget {
  final SelectedSchoolData schoolData;

  const AddStudent({
    Key? key,
    required this.schoolData,
  }) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController studentRegController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  // StudentListController studentListController =
  //     Get.put(StudentListController());
  // AddStudentController addStudentController = Get.put(AddStudentController());
  // final UserController userController = Get.find<UserController>();

  // List<String> filters = [];
  // String? _selectedFilter;
  // bool isExpanded = false;
  // bool isSearchFieldEnable = false;
  // bool isLoading = false;

  @override
  void initState() {
    context.read<AddStudentBloc>().add(
          AddFilters(
            studentType: widget.schoolData.payeeType,
          ),
        );
    // filters = widget.schoolData.payeeType == 'STUDENT'
    //     ? ['Name', 'Account Number', 'Student ID']
    //     : ['Account Number'];
    super.initState();
  }

  // onSearchTextChanged(String text) async {
  //   _searchResult.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }
  //   switch (_selectedFilter) {
  //     case 'Name':
  //       if (studentListController.studentList.value.getStudent != null &&
  //           studentListController
  //               .studentList.value.getStudent!.rows!.isNotEmpty) {
  //         studentListController.studentList.value.getStudent!.rows!.clear();
  //       }
  //       await studentListController.search(
  //         searchBy: 'name',
  //         queryParam: searchController.text,
  //         schoolId: widget.schoolData.id,
  //       );
  //       isLoading = false;
  //       if (studentListController.studentList.value.getStudent != null) {
  //         studentListController.studentList.value.getStudent!.rows!
  //             .forEach((studentDetails) {
  //           _searchResult.add(studentDetails);
  //         });
  //       }
  //       setState(() {});
  //       break;
  //     case 'Account Number':
  //       if (studentListController.studentList.value.getStudent != null &&
  //           studentListController
  //               .studentList.value.getStudent!.rows!.isNotEmpty) {
  //         studentListController.studentList.value.getStudent!.rows!.clear();
  //       }
  //       await studentListController.search(
  //         searchBy: 'account',
  //         queryParam: searchController.text,
  //         schoolId: widget.schoolData.id,
  //       );
  //       isLoading = false;
  //       if (studentListController.studentList.value.getStudent != null) {
  //         studentListController.studentList.value.getStudent!.rows!
  //             .forEach((studentDetails) {
  //           _searchResult.add(studentDetails);
  //         });
  //       }
  //       setState(() {});
  //       break;
  //     case 'Student ID':
  //       if (studentListController.studentList.value.getStudent != null &&
  //           studentListController
  //               .studentList.value.getStudent!.rows!.isNotEmpty) {
  //         studentListController.studentList.value.getStudent!.rows!.clear();
  //       }
  //       await studentListController.search(
  //         searchBy: 'sid',
  //         queryParam: searchController.text,
  //         schoolId: widget.schoolData.id,
  //       );
  //       isLoading = false;
  //       if (studentListController.studentList.value.getStudent != null) {
  //         studentListController.studentList.value.getStudent!.rows!
  //             .forEach((studentDetails) {
  //           _searchResult.add(studentDetails);
  //         });
  //       }
  //       setState(() {});
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(
                    24,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpacer(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBarBackButton(
                        buttonColor: colors.white,
                        iconColor: colors.primaryColor,
                      ),
                      horizontalSpacer(40),
                      Center(
                        child: Text(
                          addStudent,
                          textAlign: TextAlign.center,
                          style: textStyles.bold.copyWith(
                            color: colors.white,
                            fontSize: sizes.fontRatio * 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpacer(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SchoolContainer(
                        selectedSchoolData: widget.schoolData,
                      ),
                      verticalSpacer(20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: colors.white,
                                ),
                                color: colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              // child: DropdownButtonHideUnderline(
                              //   child: ButtonTheme(
                              //     alignedDropdown: true,
                              //     child: DropdownButton(
                              //       borderRadius:
                              //           BorderRadius.circular(16),
                              //       elevation: 0,
                              //       isExpanded: true,
                              //       items: filters.map((String value) {
                              //         return DropdownMenuItem<String>(
                              //           value: value,
                              //           child: Text(
                              //             value,
                              //             style: colors
                              //                 .h2_12blueAccent
                              //                 .copyWith(
                              //               fontSize:
                              //                   sizes.fontRatio * 14,
                              //               fontWeight: FontWeight.bold,
                              //               color: colors.black,
                              //             ),
                              //           ),
                              //         );
                              //       }).toList(),
                              //       value: _selectedFilter,
                              //       hint: Text(
                              //         "Search by",
                              //       ),
                              //       // value: selection,
                              //       onChanged: (newValue) {
                              //         setState(
                              //           () {
                              //             _selectedFilter =
                              //                 newValue.toString();
                              //             print(
                              //               _selectedFilter,
                              //             );
                              //           },
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              child:
                                  BlocBuilder<AddStudentBloc, AddStudentState>(
                                builder: (context, state) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      buttonPadding: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(16),
                                      ),
                                      style: textStyles.regular.copyWith(
                                        fontSize: sizes.fontRatio * 14,
                                        color: colors.lightGreyShade,
                                      ),
                                      icon: SvgPicture.asset(
                                        assets.icArrowDropDown,
                                      ),
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        ),
                                        border: Border.all(
                                          color: colors.primaryColor,
                                        ),
                                      ),
                                      isExpanded: false,
                                      hint: Text(
                                        'Search By',
                                        style: textStyles.bold.copyWith(
                                          fontSize: sizes.fontRatio * 14,
                                          color: colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      items: state.filters
                                          .map(
                                            (item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: textStyles.semiBold
                                                    .copyWith(
                                                  fontSize:
                                                      sizes.fontRatio * 14,
                                                  color: colors.lightGreyShade,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      value: state.selectedFilter,
                                      onChanged: (value) {
                                        context.read<AddStudentBloc>().add(
                                              DropDownButtonOnChange(
                                                value: value.toString(),
                                                isSearchFieldEnable: true,
                                              ),
                                            );
                                        // _selectedFilter = value as String;
                                        // isSearchFieldEnable = true;
                                        // setState(() {});
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      verticalSpacer(12),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                        ),
                        child: BlocBuilder<AddStudentBloc, AddStudentState>(
                          builder: (context, state) {
                            return TextFormField(
                              controller: searchController,
                              onChanged: (value) {
                                context.read<AddStudentBloc>().add(
                                      AddStudentOnSearchChange(
                                        value: '',
                                        schoolID: widget.schoolData.id,
                                        queryParam: searchController.text,
                                      ),
                                    );
                              },
                              onTap: () {
                                if (state.isSearchFieldEnable) {
                                  context.read<AddStudentBloc>().add(
                                        AddStudentOnSearchChange(
                                          value: '',
                                          schoolID: widget.schoolData.id,
                                          queryParam: searchController.text,
                                        ),
                                      );
                                  // onSearchTextChanged('');
                                } else {
                                  showToast(
                                    context: context,
                                    message: pleaseSelectSearchByFieldFirst,
                                    color: colors.primaryColor,
                                  );
                                }
                              },
                              enabled: state.isSearchFieldEnable,
                              onEditingComplete: () {
                                if (searchController.text.isNotEmpty) {
                                  context.read<AddStudentBloc>().add(
                                        AddStudentOnSearchChange(
                                          value: '',
                                          schoolID: widget.schoolData.id,
                                          queryParam: searchController.text,
                                        ),
                                      );
                                  // onSearchTextChanged(
                                  //   searchController.text,
                                  // );
                                } else {
                                  state.searchResult.clear();
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(13),
                                filled: true,
                                fillColor: colors.white,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: colors.primaryColor.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: colors.primaryColor,
                                ),
                                hintText: searchStudent,
                                hintStyle: textStyles.bold.copyWith(
                                  fontSize: sizes.fontRatio * 13,
                                  color: colors.textGrey.withOpacity(0.3),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              style: TextStyle(
                                color: colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                      verticalSpacer(16),
                    ],
                  )
                ],
              ),
            ),
            BlocBuilder<AddStudentBloc, AddStudentState>(
              builder: (context, state) {
                return state.searchResult.isNotEmpty ||
                        searchController.text.isNotEmpty
                    ? state.studentListResponseModel.getStudent != null &&
                            state.studentListResponseModel.getStudent!.rows!
                                .isNotEmpty
                        ? Column(
                            children: [
                              verticalSpacer(16),
                              GetText(
                                length: state.searchResult.length,
                              ),
                              ListView.separated(
                                itemCount: state.searchResult.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWellWidget(
                                        onTap: () {},
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: horizontalValue(20),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: horizontalValue(12),
                                            vertical: verticalValue(8),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: colors.primaryColor,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: sizes.heightRatio * 50,
                                                width: sizes.widthRatio * 50,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: SvgPicture.asset(
                                                  state.searchResult[index]
                                                              .gender ==
                                                          "male"
                                                      ? assets.icMale
                                                      : assets.icFemale,
                                                ),
                                              ),
                                              horizontalSpacer(26),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        sizes.widthRatio * 100,
                                                    child: BlocBuilder<
                                                            AddStudentBloc,
                                                            AddStudentState>(
                                                        builder:
                                                            (context, state) {
                                                      return Text(
                                                        '${state.searchResult[index].firstName}\n${state.searchResult[index].lastName ?? ''}',
                                                        style: textStyles.bold
                                                            .copyWith(
                                                          fontSize:
                                                              sizes.fontRatio *
                                                                  14,
                                                          color: colors.black,
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                  verticalSpacer(4),
                                                  BlocBuilder<AddStudentBloc,
                                                      AddStudentState>(
                                                    builder: (context, state) {
                                                      return state
                                                                  .searchResult[
                                                                      index]
                                                                  .grade !=
                                                              null
                                                          ? Text(
                                                              'Grade ${state.searchResult[index].grade}',
                                                              style: textStyles
                                                                  .regular
                                                                  .copyWith(
                                                                fontSize: sizes
                                                                        .fontRatio *
                                                                    10,
                                                                color: colors
                                                                    .textGrey,
                                                              ),
                                                            )
                                                          : const SizedBox
                                                              .shrink();
                                                    },
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              BlocConsumer<AddStudentBloc,
                                                  AddStudentState>(
                                                builder: (context, state) {
                                                  return ActionButton(
                                                    onTap: () async {
                                                      if (state
                                                              .selectedFilter ==
                                                          'Account Number') {
                                                        // final model = {
                                                        //   "parentRegNo":
                                                        //       searchController
                                                        //           .text
                                                        //           .toString(),
                                                        //   "studentId":
                                                        //       state.searchResult[index]
                                                        //           .id
                                                        //           .toString(),
                                                        // };
                                                        context
                                                            .read<
                                                                AddStudentBloc>()
                                                            .add(
                                                                AddStudentLoading());
                                                        context
                                                            .read<
                                                                AddStudentBloc>()
                                                            .add(
                                                              AddStudentByParentID(
                                                                studentID: state
                                                                    .searchResult[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                parentRegNo:
                                                                    searchController
                                                                        .text
                                                                        .toString(),
                                                              ),
                                                            );
                                                        // await addStudentController
                                                        //     .hitAddStudentByParentId(
                                                        //   model,
                                                        // );
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                        // setState(() {});
                                                        // if (addStudentController
                                                        //     .isStudentAdded) {
                                                        //   SuccessBottomSheet.show(
                                                        //     context: context,
                                                        //   );
                                                        // } else {
                                                        //   showToast(
                                                        //       context: context,
                                                        //       message: addStudentController
                                                        //               .addStudentData
                                                        //               .value
                                                        //               .message ??
                                                        //           'Verification Failed',
                                                        //       color: colors.red);
                                                        // }

                                                        //   searchController.text =
                                                        //       '';
                                                        //   if (studentListController
                                                        //               .studentList
                                                        //               .value
                                                        //               .getStudent !=
                                                        //           null &&
                                                        //       studentListController
                                                        //           .studentList
                                                        //           .value
                                                        //           .getStudent!
                                                        //           .rows!
                                                        //           .isNotEmpty) {
                                                        //     studentListController
                                                        //         .studentList
                                                        //         .value
                                                        //         .getStudent!
                                                        //         .rows!
                                                        //         .clear();
                                                        //   }
                                                      }
                                                      if (state
                                                              .selectedFilter ==
                                                          'Student ID') {
                                                        // final model = {
                                                        //   "studentRegNo":
                                                        //       searchController
                                                        //           .text
                                                        //           .toString(),
                                                        //   "studentId":
                                                        //       _searchResult[index]
                                                        //           .id
                                                        //           .toString(),
                                                        // };
                                                        context
                                                            .read<
                                                                AddStudentBloc>()
                                                            .add(
                                                                AddStudentLoading());
                                                        context
                                                            .read<
                                                                AddStudentBloc>()
                                                            .add(
                                                              AddStudentByStudentID(
                                                                studentID: state
                                                                    .searchResult[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                studentRegNo:
                                                                    searchController
                                                                        .text
                                                                        .toString(),
                                                              ),
                                                            );
                                                        // await addStudentController
                                                        //     .hitAddStudentByStudentId(
                                                        //   model,
                                                        // );
                                                        Navigator.of(context)
                                                            .pop();
                                                        // setState(() {});
                                                        // if (addStudentController
                                                        //     .isStudentAdded) {
                                                        //   SuccessBottomSheet.show(
                                                        //     context: context,
                                                        //   );
                                                        // } else {
                                                        //   showToast(
                                                        //       context: context,
                                                        //       message: addStudentController
                                                        //               .addStudentData
                                                        //               .value
                                                        //               .message ??
                                                        //           'Verification Failed',
                                                        //       color: colors.red);
                                                        // }
                                                        //
                                                        // searchController.text =
                                                        //     '';
                                                        // if (studentListController
                                                        //             .studentList
                                                        //             .value
                                                        //             .getStudent !=
                                                        //         null &&
                                                        //     studentListController
                                                        //             .studentList
                                                        //             .value
                                                        //             .getStudent!
                                                        //             .rows!.isNotEmpty) {
                                                        //   studentListController
                                                        //       .studentList
                                                        //       .value
                                                        //       .getStudent!
                                                        //       .rows!
                                                        //       .clear();
                                                        // }
                                                      }
                                                      if (state.selectedFilter !=
                                                              'Account Number' &&
                                                          state.selectedFilter !=
                                                              'Student ID') {
                                                        StudentBottomSheet.show(
                                                          context: context,
                                                          selectedStudentID:
                                                              state
                                                                  .searchResult[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                          selectedStudentRegNo:
                                                              state
                                                                  .searchResult[
                                                                      index]
                                                                  .studentRegNo
                                                                  .toString(),
                                                          onTap: (
                                                            studentId,
                                                            parentId,
                                                            dob,
                                                          ) async {
                                                            if (studentId
                                                                    .isNotEmpty ||
                                                                dob
                                                                    .isNotEmpty ||
                                                                parentId
                                                                    .isNotEmpty) {
                                                              // final model = {
                                                              //   "parentRegNo":
                                                              //       parentId,
                                                              //   "dob": dob,
                                                              //   "studentId":
                                                              //       _searchResult[
                                                              //               index]
                                                              //           .id
                                                              //           .toString(),
                                                              //   "studentRegNo":
                                                              //       studentId,
                                                              // };
                                                              context
                                                                  .read<
                                                                      AddStudentBloc>()
                                                                  .add(
                                                                      AddStudentLoading());
                                                              context
                                                                  .read<
                                                                      AddStudentBloc>()
                                                                  .add(
                                                                    AddStudentByFirstName(
                                                                      parentID:
                                                                          parentId,
                                                                      dob: dob,
                                                                      studentID: state
                                                                          .searchResult[
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      studentRegNo:
                                                                          studentId,
                                                                    ),
                                                                  );
                                                              // await addStudentController
                                                              //     .hitAddStudentByFirstName(
                                                              //   model,
                                                              // );
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                              // setState(() {});
                                                              // if (addStudentController
                                                              //     .isStudentAdded) {
                                                              //   SuccessBottomSheet
                                                              //       .show(
                                                              //     context:
                                                              //         context,
                                                              //   );
                                                              // } else {
                                                              //   showToast(
                                                              //       context:
                                                              //           context,
                                                              //       message: addStudentController
                                                              //               .addStudentData
                                                              //               .value
                                                              //               .message ??
                                                              //           'Verification Failed',
                                                              //       color: colors
                                                              //           .red);
                                                              // }
                                                              //
                                                              // searchController
                                                              //     .text = '';
                                                              // if (studentListController
                                                              //             .studentList
                                                              //             .value
                                                              //             .getStudent !=
                                                              //         null &&
                                                              //     studentListController
                                                              //             .studentList
                                                              //             .value
                                                              //             .getStudent!
                                                              //             .rows!.isNotEmpty) {
                                                              //   studentListController
                                                              //       .studentList
                                                              //       .value
                                                              //       .getStudent!
                                                              //       .rows!
                                                              //       .clear();
                                                              // }
                                                            } else {
                                                              showToast(
                                                                context:
                                                                    context,
                                                                message:
                                                                    fieldsCannotBeEmpty,
                                                                color:
                                                                    colors.red,
                                                              );
                                                            }
                                                          },
                                                        );
                                                      }
                                                    },
                                                  );
                                                },
                                                listener: (context, state) {
                                                  switch (state.status) {
                                                    case AddStudentStatus.init:
                                                      // TODO: Handle this case.
                                                      break;
                                                    case AddStudentStatus
                                                        .loading:
                                                      // TODO: Handle this case.
                                                      break;
                                                    case AddStudentStatus
                                                        .success:
                                                      SuccessBottomSheet.show(
                                                        context: context,
                                                      );
                                                      break;
                                                    case AddStudentStatus.error:
                                                      showToast(
                                                        context: context,
                                                        message:
                                                            state.errorMessage,
                                                        color: colors.red,
                                                      );
                                                      break;
                                                  }
                                                },
                                              ),
                                              horizontalSpacer(12),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return verticalSpacer(12);
                                },
                              ),
                              verticalSpacer(24),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(40),
                                ),
                                child: Text(
                                  forAlternateUseCaseWithAllTextFieldsPleaseClickHereThisWillNotBeShownOnActualApp,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  style: textStyles.regular.copyWith(
                                    color: colors.textGrey,
                                    fontSize: sizes.fontRatio * 10,
                                  ),
                                ),
                              ),
                              verticalSpacer(16),
                            ],
                          )
                        : const NoDataText()
                    : const SizedBox.shrink();
              },
            ),
            BlocBuilder<AddStudentBloc, AddStudentState>(
              builder: (context, state) {
                return state.searchResult.isNotEmpty ||
                        searchController.text.isNotEmpty
                    ? state.studentListResponseModel.getStudent != null &&
                            state.studentListResponseModel.getStudent!.rows!
                                .isNotEmpty
                        ? verticalSpacer(0)
                        : verticalSpacer(80)
                    : verticalSpacer(220);
              },
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(32),
              ),
              child: BlocBuilder<AddStudentBloc, AddStudentState>(
                builder: (context, state) {
                  return ElevatedButtons(
                    isLoading:
                        state.status == AddStudentStatus.loading ? true : false,
                    text: search,
                    textColor: colors.white,
                    color: colors.primaryColor,
                    showIcon: false,
                    onPressed: () {
                      if (searchController.text.isEmpty) {
                        showToast(
                          context: context,
                          message: searchCannotBeEmpty,
                          color: colors.red,
                        );
                      }
                      if (searchController.text.isNotEmpty) {
                        context.read<AddStudentBloc>().add(
                              AddStudentOnSearchChange(
                                value: '',
                                schoolID: widget.schoolData.id,
                                queryParam: searchController.text,
                              ),
                            );
                        // onSearchTextChanged(
                        //   searchController.text,
                        // );
                      } else {
                        state.searchResult.clear();
                      }
                    },
                  );
                },
              ),
            ),
            verticalSpacer(16),
          ],
        ),
      ),
    );
  }
}
