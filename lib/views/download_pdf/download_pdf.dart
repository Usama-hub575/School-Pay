import 'dart:io';
import 'dart:typed_data';

// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as date;
import 'package:path_provider/path_provider.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../res/res.dart';
import '../../widgets/spacer.dart';

class PdfApi {
  static Future openFile({required File file}) {
    return PDFDocument.openFile(file);
  }

  static Future<File> generatePdfFile(
    SingleStudentModel student,
  ) async {
    final pdf = Document();
    var data =
        await rootBundle.load("assets/fonts/Montserrat/Montserrat-Regular.ttf");
    var myFont = Font.ttf(data);
    var myTheme = ThemeData.withFont(
      base: Font.ttf(
        await rootBundle.load("assets/fonts/Montserrat/Montserrat-Regular.ttf"),
      ),
      bold: Font.ttf(
        await rootBundle.load("assets/fonts/Montserrat/Montserrat-Regular.ttf"),
      ),
      italic: Font.ttf(
        await rootBundle.load("assets/fonts/Montserrat/Montserrat-Regular.ttf"),
      ),
      boldItalic: Font.ttf(
        await rootBundle.load("assets/fonts/Montserrat/Montserrat-Regular.ttf"),
      ),
    );

    // selectedLang == 0 ?
    pdf.addPage(
      MultiPage(
        theme: myTheme,
        build: (context) => [
          buildHeader(
            font: myFont,
          ),
          spacing(),
          buildBody(
            data: student,
            font: myFont,
          ),
        ],
      ),
    );
    // : pdf.addPage(
    //     MultiPage(
    //       theme: myTheme,
    //       build: (context) => [
    //         buildArabicHeader(
    //           data: vouchers,
    //           font: myFont,
    //         ),
    //         spacing(),
    //         buildArabicBody(
    //           data: vouchers,
    //           font: myFont,
    //         ),
    //         spacing(),
    //         buildQrImage(
    //           image: image,
    //         ),
    //       ],
    //     ),
    //   );

    return PDFDocument.saveDocument(name: 'L${student.id}', pdf: pdf);
  }

  static Widget buildHeader({
    required font,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(12),
        vertical: verticalValue(6),
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      color: const PdfColor(
        0.078,
        0.498,
        0.559,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Payment Invoice",
            style: TextStyle(
              font: font,
              fontSize: sizes.fontRatio * 18,
              color: const PdfColor(
                1,
                1,
                1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget spacing() {
    return SizedBox(
      height: 3 * PdfPageFormat.cm,
    );
  }

  static Widget buildBody({
    required SingleStudentModel data,
    required font,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'Student Name ',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  '${data.student!.firstName.toString()}  ${data.student!.lastName.toString()}',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'Class',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.student!.grade,
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'Student ID ',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    data.student!.schoolId.toString(),
                    style: TextStyle(
                      font: font,
                      fontSize: sizes.fontRatio * 16,
                      color: const PdfColor(
                        00,
                        0.345,
                        0.392,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'Reference Number',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.student!.studentRegNo,
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'School Name ',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.student!.school!.name,
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'Due Date',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  getPaymentDate(data.student!.dueDate.toString()),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  'Amount To Be Paid',
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.student!.totalBalanceAmount.toString(),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildQrImage({required Uint8List image}) {
    var img = MemoryImage(image);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Image(
        img,
      ),
    );
  }

  // static Widget buildFooter({
  //   required Vouchers data,
  // }) {
  //   return Container(
  //     width: double.infinity,
  //     height: sizes.heightRatio! * 60,
  //     color: const PdfColor(
  //       00,
  //       0.345,
  //       0.392,
  //     ),
  //   );
  // }

  static Widget buildArabicFooter({
    required SingleStudentModel data,
  }) {
    return Container(
      width: double.infinity,
      height: sizes.heightRatio * 60,
      color: const PdfColor(
        00,
        0.345,
        0.392,
      ),
    );
  }

  // it will make a named dircotory in the internal storage and then return to its call
  static Future<File> saveDocument({
    String name = 'voucher',
    required Document pdfD,
  }) async {
    // pdf save to the variable called bytes
    final bytes = await pdfD.save();

    // here a beautiful pakage  path provider helps us and take dircotory and name of the file  and made a proper file in internal storage
    final dir = await getApplicationDocumentsDirectory();
    final file = File('/storage/emulated/0/Download/$name');

    await file.writeAsBytes(bytes).then((value) {
      print('value=> $value');
    });

    // reterning the file to the top most method which is generate centered text.
    return file;
  }

  // static String getNationality(int nationalityId) {
  //   int index = countriesController.countries
  //       .indexWhere((element) => element.id == nationalityId);
  //   return countriesController.countries[index].name;
  // }

  static String getPaymentTime(String dateTime) {
    if (dateTime.isNotEmpty) {
      return dateTime.substring(12, 19);
    }
    return '';
  }

  static String getPaymentDate(String dateTime) {
    if (dateTime.isNotEmpty) {
      return dateTime.substring(0, 10);
    }
    return '';
  }
}

String getPaymentDate(String dateTime) {
  if (dateTime.isNotEmpty) {
    return date.DateFormat.yMMMMd('en_GB')
        .format(DateTime.parse(dateTime.substring(0, 10)));
  }
  return '';
}

class PDFDocument {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = (await getExternalStorageDirectory())?.path;
    final file = File('$dir/$name.pdf');
    // final file = File('/storage/emulated/0/Download/$name.pdf');

    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    //await OpenFile.open(url);
  }
}
