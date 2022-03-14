import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/add_student.dart';

class SelectSchool extends StatefulWidget {
  const SelectSchool({Key? key}) : super(key: key);

  @override
  State<SelectSchool> createState() => _SelectSchoolState();
}

class _SelectSchoolState extends State<SelectSchool> {
  List<String> _texts = [
    "InduceSmile.com",
    "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];

  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton.extended(
        // isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r)
        ),
        backgroundColor: Colors.white,
        onPressed: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudent()));
          // selectedNavItem(2);
        },
        // extendedPadding: EdgeInsets.symmetric(horizontal: 50.w),
        // icon:
        label: Row(
          children: [
          Text(
          next,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 12.sp
          )),
            SizedBox(width: 214.w,),
            SvgPicture.asset(arrowNext),
          ],
        ),//icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Column(
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
                        child: TextField(
                          decoration: InputDecoration(
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
                              borderRadius: BorderRadius.circular(12.r)
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
            ),
          ),
           Expanded(
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: _texts.length,
               physics: BouncingScrollPhysics(),
               itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(),
                            SizedBox(width: 10.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(_texts[index],style: PayNestTheme.title_3_16black,),
                                Text(_texts[index],style: PayNestTheme.small_2_12textGrey,),
                              ],
                            ),
                          ],
                        ),
                        value: _isChecked[index],
                        onChanged: (val) {
                          setState(() {
                            _isChecked[index] = val!;
                            print(_isChecked[index]);
                          });
                        },
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
      ),
    );
  }
}
