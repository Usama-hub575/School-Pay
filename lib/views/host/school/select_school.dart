import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/school_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/selectedschool_to_addstudent.dart';
import 'package:paynest_flutter_app/model/schoollist_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/add_student.dart';

class SelectSchool extends StatefulWidget {
  const SelectSchool({Key? key}) : super(key: key);

  @override
  State<SelectSchool> createState() => _SelectSchoolState();
}

class _SelectSchoolState extends State<SelectSchool> {
  SchoolController schoolController = Get.put(SchoolController());
  TextEditingController ssController = TextEditingController();

  @override
  initState() {
    super.initState();
    schoolController.hitSchoolList();
  }

  /// ** Search ** ///
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    schoolController.schoolResList.value.log!.forEach((schoolDetail) {
      if (schoolDetail.name.toUpperCase().contains(text.toUpperCase()) || schoolDetail.address.toUpperCase().contains(text.toUpperCase())) {
        _searchResult.add(schoolDetail);
      }
    });

    setState(() {});
  }
  List<Log> _searchResult = [];
  /// -- Search -- ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton:FloatingActionButton.extended(
      //   // isExtended: true,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12.r)
      //   ),
      //   backgroundColor: Colors.white,
      //   onPressed: (){
      //     print("LIST");
      //
      //     var value = _isChecked.indexWhere((item) => item == true);
      //     print(value);
      //   },
      //   // extendedPadding: EdgeInsets.symmetric(horizontal: 50.w),
      //   // icon:
      //   label: Row(
      //     children: [
      //       Text(
      //       next,
      //       style: TextStyle(
      //           color: Colors.blue,
      //           fontSize: 12.sp
      //       )),
      //         SizedBox(width: 214.w,),
      //         SvgPicture.asset(arrowNext),
      //     ],
      //   ),//icon inside button
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Obx(()=>!schoolController.isLoading.value ? Column(
        children: [
          Container(
            height:210.h,
            decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 25.w,top: 25.h,right: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25.w),
                          child: Container(
                            height : 44.h,
                            width : 44.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r)
                            ),
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back,size: 20.sp,color: PayNestTheme.blueAccent),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        Text(selectSchool,style: PayNestTheme.title20white,),
                      ],
                    ),

                      Padding(
                        padding: EdgeInsets.only(top: 22.h),
                        child: TextFormField(
                          onTap: (){
                            onSearchTextChanged('');
                          },
                          controller: ssController,
                          onChanged: onSearchTextChanged,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                            filled: true,
                            fillColor: PayNestTheme.colorWhite,
                            suffixIcon: Icon(Icons.search,color: PayNestTheme.primaryColor,),
                            hintText: searchSchool,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                color: PayNestTheme.primaryColor,

                                width: 1.w,
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: PayNestTheme.primaryColor,
                                    width: 1.w
                                )
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          _searchResult.isNotEmpty || ssController.text.isNotEmpty ?
           Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _searchResult.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap:(){
                        SelectedSchoolData schoolData = SelectedSchoolData(
                            id: _searchResult[index].id,
                            name: _searchResult[index].name,
                            deletedAt: _searchResult[index].deletedAt,
                            addedBy: _searchResult[index].addedBy,
                            address: _searchResult[index].address,
                            description: _searchResult[index].description,
                            vat: _searchResult[index].vat,
                            paynestFee: _searchResult[index].paynestFee,
                            apiKey: _searchResult[index].apiKey,
                            merchantId: _searchResult[index].merchantId,
                            file: _searchResult[index].file,
                            privacy: _searchResult[index].privacy,
                            createdAt: _searchResult[index].createdAt,
                            updatedAt: _searchResult[index].updatedAt
                        );
                        print(schoolData.name);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudent(
                          schoolData: schoolData,
                        )));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 10.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(_searchResult[index].name,style: PayNestTheme.title_3_16black,),
                              Text(_searchResult[index].address,style: PayNestTheme.small_2_12textGrey,),
                            ],
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(arrowNext),
                      // value: _isChecked[index],
                      // onChanged: (val) {
                      //   setState(() {
                      //     _isChecked[index] = val!;
                      //     print(_isChecked[index]);
                      //   });
                      // },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                      child: Container(
                        width: 1.sw,
                        height: 1,
                        color: Colors.grey,
                      ),
                    )
                  ],
                );
              },
            ),
          )

              // Full List
           :Expanded(
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: schoolController.schoolResList.value.log!.length,
               physics: BouncingScrollPhysics(),
               itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap:(){
                          SelectedSchoolData schoolData = SelectedSchoolData(
                              id: schoolController.schoolResList.value.log![index].id,
                              name: schoolController.schoolResList.value.log![index].name,
                              deletedAt: schoolController.schoolResList.value.log![index].deletedAt,
                              addedBy: schoolController.schoolResList.value.log![index].addedBy,
                              address: schoolController.schoolResList.value.log![index].address,
                              description: schoolController.schoolResList.value.log![index].description,
                              vat: schoolController.schoolResList.value.log![index].vat,
                              paynestFee: schoolController.schoolResList.value.log![index].paynestFee,
                              apiKey: schoolController.schoolResList.value.log![index].apiKey,
                              merchantId: schoolController.schoolResList.value.log![index].merchantId,
                              file: schoolController.schoolResList.value.log![index].file,
                              privacy: schoolController.schoolResList.value.log![index].privacy,
                              createdAt: schoolController.schoolResList.value.log![index].createdAt,
                              updatedAt: schoolController.schoolResList.value.log![index].updatedAt
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudent(
                            schoolData: schoolData,
                          )));
                        },
                        title: Text(schoolController.schoolResList.value.log![index].name,style: PayNestTheme.title_3_16black,),
                        trailing: SvgPicture.asset(arrowNext),
                        subtitle: Text(schoolController.schoolResList.value.log![index].address,style: PayNestTheme.small_2_12textGrey),
                        leading:  CircleAvatar(),
                        dense: true,

                        // value: _isChecked[index],
                        // onChanged: (val) {
                        //   setState(() {
                        //     _isChecked[index] = val!;
                        //     print(_isChecked[index]);
                        //   });
                        // },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                        child: Container(
                          width: 1.sw,
                          height: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  );
              },
          ),
           ),
        ],
      ):Center(child: CircularProgressIndicator())),
    );
  }
}
