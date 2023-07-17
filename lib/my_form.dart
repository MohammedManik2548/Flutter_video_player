
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MyForm{

  static Future<FormData> myFromMaker(Map<String, dynamic> map)async{
    return FormData.fromMap(map);
  }


  static Future<FormData> myFromMakerWithFile(Map<String, dynamic> map, File file)async{
    Map<String, dynamic>  myProcessData={};
    map.forEach((key, value) {
      myProcessData[key]=value;
    });
    myProcessData['deposit_file']= await MultipartFile.fromFile(file.path);
    //
    // debugPrint("My_From: $myProcessData");
    // // debugPrint("My_From: ${file.path}");

    return FormData.fromMap(myProcessData);
  }

  static Future<FormData> myFromMakerWithFile2(Map<String, dynamic> map, File file1,File file2,File file3,File file4)async{
    Map<String, dynamic>  myProcessData={};
    map.forEach((key, value) {
      myProcessData[key]=value;
    });
    myProcessData['investorProfileImage']= await MultipartFile.fromFile(file1.path, filename: 'file1');
    myProcessData['investorNidImage']= await MultipartFile.fromFile(file2.path);
    myProcessData['investorSignImage']= await MultipartFile.fromFile(file3.path);
    myProcessData['investorBoImage']= await MultipartFile.fromFile(file4.path);
    //
    // debugPrint("My_From: $myProcessData");
    // // debugPrint("My_From: ${file.path}");

    return FormData.fromMap(myProcessData);
  }


  // Map<String, File> mapData={};
  // mapData["applicant_photo"]=fileNo1.value;
  // mapData["applicant_sign"]=fileNo2.value;
  // mapData["nid_copy"]=fileNo3.value;
  // mapData[ "tin"]=fileNo4.value;
  //
  //
  // if(jointAccount.value==true){
  // mapData["joint_applicant_photo"]=fileNo7.value;
  // mapData[ "joint_applicant_sign"]=fileNo8.value;
  // mapData["joint_tin"]=fileNo10.value;
  // }
  //
  //
  // mapData["nominee_applicant_photo"]=fileNo11.value;
  // mapData["nominee_applicant_sign"]=fileNo12.value;
  // mapData["nominee_nid_applicant_photo"]=fileNo13.value;


  static Future<FormData> fileToMap({required Map<String, dynamic> map,required File file1, required File file2, required File file3, required File file4})async{

    Map<String, dynamic> mapData={};
    map.forEach((key, value) {
      mapData[key]=value;
    });
    mapData["investorProfileImage"]=await MultipartFile.fromFile(file1.path, filename: 'file1');
    mapData["investorNidImage"]=await MultipartFile.fromFile(file2.path);
    mapData["investorSignImage"]=await MultipartFile.fromFile(file3.path);
    mapData[ "investorBoImage"]=await MultipartFile.fromFile(file4.path);



    return FormData.fromMap(mapData);
  }

  static Future<FormData> mapWithFile({required Map<String, dynamic> map, required File file1, required File file2, required File file3, required File file4})async {

    Map<String, dynamic> data={};
    data.addAll(map);
    debugPrint('dsafsdfsd: $data');

    debugPrint(file1.path);
    // debugPrint('dsafsdfsd_file2: ${file2.path}');
    // debugPrint('dsafsdfsd_file3: ${file4.path}');
    // debugPrint('dsafsdfsd_file4: ${file4.path}');

    // investorProfileImage
    // investorSignImage
    // investorNidImage
    // investorBoImage

    data["investorProfileImage"]=await MultipartFile.fromFile(file1.path);
    data["investorNidImage"]=await MultipartFile.fromFile(file2.path);
    data["investorSignImage"]=await MultipartFile.fromFile(file3.path);
    data["investorBoImage"]=await MultipartFile.fromFile(file4.path);

    return FormData.fromMap(data);
  }

  // void downloadPDF() async {
  //   SharedPreferences p = await SharedPreferences.getInstance();
  //   var access=p.getString('access_token');
  //
  //   String url = Api.reportTrans;
  //
  //   Map<String, dynamic> mapData ={
  //     'registration_no':etControllerReg.text,
  //     'start_date':etControllerDateFrom.text,
  //     'end_date':etControllerDateTo.text,
  //   };
  //
  //   debugPrint('$runtimeType HIT_URL1:-$url');
  //   try {
  //     await AppConstant.checkInternetConnection().then((value) async{
  //       if (value == true) {
  //         EasyLoading.show(status: 'Loading');
  //
  //         var  directory = await getApplicationDocumentsDirectory();
  //         String saveName = "Sandhani_transaction_history-$dateNow.pdf";
  //         final String filePath = '${directory.path}/$saveName';
  //         final File file = File(filePath);
  //         var response = await Dio().post(url,data:mapData,options: Options(
  //             headers: {
  //               "Authorization":"Bearer $access"
  //             },
  //             responseType: ResponseType.bytes,
  //             followRedirects: false,
  //             receiveTimeout: const Duration(seconds:30)
  //         ));
  //
  //         debugPrint('Internet Connected: $runtimeType');
  //         debugPrint('$runtimeType:->Status Code  ${response.statusCode}');
  //
  //         if(response.statusCode==200){
  //           final raf=file.openSync(mode: FileMode.write);
  //           raf.writeFromSync(response.data);
  //           await raf.close();
  //           EasyLoading.dismiss();
  //           OpenFile.open(file.path);
  //         }
  //
  //       } else {
  //         AppConstant.internetConnectionAlertDialog();
  //       }
  //     });
  //   } catch (e, l) {
  //     AppConstant.internetErrorAlert('Oops!', 'Somethings went wrong');
  //     EasyLoading.dismiss();
  //   }
  //
  // }

  static String singleValueFormat(String v1) {
    double value1 = double.parse(v1.toString());
    String value = NumberFormat.decimalPattern().format(value1);
    return value;
  }

  static Future<bool> checkInternetConnection() async {
    bool isAvailable = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      debugPrint('Internet Connection available ');
      isAvailable = true;
    } else {
      debugPrint('No Internet Connection available ');
      isAvailable = false;
    }
    return isAvailable;
  }

  static String dateFormat(String substring) {
    var inputFormat = DateFormat('MM/dd/yyyy');
    var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

}