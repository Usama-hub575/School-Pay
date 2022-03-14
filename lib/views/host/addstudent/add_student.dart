import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController studentDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 460.h,
            decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 25.w,top: 25.h,right: 25.w,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25.w,),
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
                        Center(child: Text(addStudent,style: PayNestTheme.title20white)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    //FOR STACK
                    SizedBox(
                      height: 350.h,
                      width: 326.w,
                      // color: Colors.grey,
                      child: Stack(
                        alignment:Alignment.topCenter,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 41.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                                  height: 149.h,
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    color: PayNestTheme.colorWhite,
                                    borderRadius: BorderRadius.circular(16.r)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 19.h,),
                                      Text('Beaconhouse Al Khaleej International Pvt school',style: PayNestTheme.title18black,),
                                      Text('Al Riqa, Suburbal Azra, Sharjah',style: PayNestTheme.h2_14textGrey,),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1.w),
                                            color: Colors.white,
                                            borderRadius:BorderRadius.all(Radius.circular(10))),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton(
                                              // borderRadius: BorderRadius.circular(10),
                                              // dropdownColor:MyTheme.lightGreen,
                                              // iconDisabledColor: MyTheme.sharpGreen,
                                              // iconEnabledColor: MyTheme.sharpGreen,
                                              // underline: SizedBox(),
                                              // style: MyTheme.whiteText,
                                                elevation: 0,
                                                isExpanded: true,
                                                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                hint: Text(
                                                  //12112123121
                                                  "Select category",
                                                  // style: MyTheme.black18,
                                                ),
                                                // value: selection,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    // selection = int.parse(newValue.toString());
                                                    // fetchFilterProducts(selection);
                                                  });
                                                }),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(13),

                                      filled: true,
                                      fillColor: Colors.white,
                                      // enabledBorder: ,
                                      prefix: Icon(Icons.search),
                                      hintText: searchSchool,
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: CircleAvatar(
                              radius: 41.r,
                              backgroundColor: PayNestTheme.blueAccent,
                              // backgroundImage: AssetImage(ic_schoolWhite),
                              child: Padding(
                                padding: EdgeInsets.all(21.h),
                                child: Image.asset(ic_schoolWhite,fit: BoxFit.fill),
                              ),
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),


          // Search Result
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.w
                      )
                    ),
                    child: ListTile(
                      onTap: (){
                        ShowMyModal(context);
                      },
                      leading: CircleAvatar(
                      ),
                      title: Text('Ali Hamdan',style: PayNestTheme.title_3_16black,),
                      subtitle: Text('Grade 1',style: PayNestTheme.small_2_12textGrey,),
                      trailing: Container(
                        height: 26.h,
                        width: 79.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: PayNestTheme.blueAccent
                        ),
                        child: FittedBox(
                          child: Text(
                            "Verify & add",
                            style: PayNestTheme.small_2_12white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  Future<dynamic> ShowMyModal(BuildContext ctx) {
    DateTime tempPickedDate;
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      context: ctx,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(left: 28.w,right: 28.w),
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 28.h,bottom: 28.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(verifyStudent,style: PayNestTheme.title18black,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(ctx);
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: PayNestTheme.blueAccent,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(Icons.clear,color: PayNestTheme.colorWhite,size: 12.sp),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 1.sw,
                height: 1.h,
                color: PayNestTheme.lineColor,
              ),
              SizedBox(height: 15.h,),
              Text(pleaseconfirmDetailsbelow,style: PayNestTheme.title_3_16black,),

              Padding(
                padding: EdgeInsets.only(top: 22.h,bottom: 16.h),
                child: TextFormField(
                 controller: studentDate,
                 decoration: InputDecoration(
                   // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                       borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                   labelText: dob,
                   // labelStyle: CustomizedTheme.b_W400_12,
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                     borderSide: BorderSide(color: Colors.black),
                   ),
                 ),
                 onTap: (){
                   showDialog(
                      builder: (sdCTX) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.pop(sdCTX);
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: PayNestTheme.blueAccent,
                                  ),
                                  child: Center(child: Text("Done",style: PayNestTheme.small_2_12white)),
                                ),
                              )
                            ],
                          ),
                          content: SizedBox(
                            width: .9.sw,
                            height: .5.sh,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (DateTime dateTime) {
                                tempPickedDate = dateTime;
                                studentDate.text = dateTime.toString();
                                print("THIS date is picked");
                                print(tempPickedDate);
                              },
                              initialDateTime: DateTime.now(),
                            ),
                          ),
                        );
                      },
                     context: ctx
                   );
                 },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TextFormField(
                  controller: studentDate,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                    labelText: studentID,
                    // labelStyle: CustomizedTheme.b_W400_12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onTap: (){
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 63.h,bottom: 15.h),
                child: SizedBox(
                  height: 60.h,
                  width: 326.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:Colors.blue,
                      elevation: 0,
                      // side: BorderSide(width:1, color:Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: (){
                      setState(() {
                        // loading = true;
                      });
                      // Future.delayed(
                      //     Duration(seconds: 3),(){
                      //   setState(() {
                      //     // loading = false;
                      //   });
                      //   Navigator.pushNamed(context, '/OTPPage');
                      // }
                      // );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(next,style: PayNestTheme.subtitle16white,),
                        Icon(Icons.play_circle_fill,color: Colors.white,)
                      ],
                    ),
                    // label:
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
