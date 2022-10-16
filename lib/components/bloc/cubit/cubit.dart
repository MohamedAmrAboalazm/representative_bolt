import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:representative_bolt/caluclations/accounting_screen.dart';
import 'package:representative_bolt/chats/chat_messages_screen.dart';
import 'package:representative_bolt/chats/chats_screen.dart';
import 'package:representative_bolt/components/bloc/cubit/states.dart';
import 'package:representative_bolt/components/dio_helper/dio.dart';
import 'package:representative_bolt/components/items.dart';
import 'package:representative_bolt/constants/constatns.dart';
import 'package:representative_bolt/home/change_status_of_shipment.dart';
import 'package:representative_bolt/home/mandob_first_screen.dart';
import 'package:representative_bolt/home/today_deliveries_screen.dart';
import 'package:representative_bolt/login/loginScreen.dart';
import 'package:representative_bolt/models/distance_model.dart';
import 'package:representative_bolt/models/filter_search_model.dart';
import 'package:representative_bolt/models/map_model.dart';
import 'package:representative_bolt/models/note_model.dart';
import 'package:representative_bolt/models/notifactions_model.dart';
import 'package:representative_bolt/models/reasons_model.dart';
import 'package:representative_bolt/models/represtative_account.dart';
import 'package:representative_bolt/models/search_model.dart';
import 'package:representative_bolt/models/shipment_status_model.dart';
import 'package:representative_bolt/models/store_model.dart';
import 'package:representative_bolt/models/today_deliveries_model.dart';
import 'package:representative_bolt/models/total_shipment.dart';
import 'package:representative_bolt/notifications/notifications_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../constants/end_points_urls_api.dart';
import '../../../models/filter_search_model.dart';
import '../../../models/message_model.dart';
import '../../../models/representative_data_model.dart';
import '../../../models/representative_shipment_id.dart';
import '../../../models/shipmentModel.dart';
import '../../../models/user_client_model.dart';
import '../../../sms/sms_screen.dart';
import '../../sharedpref/shared_preference.dart';

class MandobCubit extends Cubit<MandobStates> {
  MandobCubit() : super(MandobInitialState());

  static MandobCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  String CurrentIndexRadioShipmentStates = "1";
   var CurrentIndexRadioShipmentReturn=false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  List<Widget> bottomScreens = [
    MandobFirstScreen(),
    TodayDliveriesScreen(),
    AccountingScreen(),
    ChatMessagesScreen(),
  ];
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
      icon: Container(width: 40, height: 40, child: Icon(Icons.home)),
      label: "الرئيسيه",
    ),
    BottomNavigationBarItem(
        icon: Container(
          width: 40,
          height: 40,
          child: SvgPicture.asset(
            "assets/icons/noun-pick-up-4160044.svg",
          ),
        ),
        label: "تسليمات اليوم"),
    BottomNavigationBarItem(
      icon: Container(
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          "assets/icons/noun-accounting-4679331.svg",
        ),
      ),
      label: "الحسابات",
    ),
    BottomNavigationBarItem(
      icon: Container(
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          "assets/icons/noun-talk-4679128.svg",
        ),
      ),
      label: "دردشه ",
    ),
  ];

  List<String> radioKeysShipmentStates = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];


  void showDialog() {
    emit(MandobShowDialogState());
  }

  void changeFirstCheckBoxDialog() {
    isChecked1 = !isChecked1;
    emit(MandobDialogFirstCheckBoxState());
  }

  void changeSecondCheckBoxDialog() {
    isChecked2 = !isChecked2;
    emit(MandobDialogSecondCheckBoxState());
  }

  void changeThirdCheckBoxDialog() {
    isChecked3 = !isChecked3;
    emit(MandobDialogThirdCheckBoxState());
  }

  void changeFourthCheckBoxDialog() {
    isChecked4 = !isChecked4;
    emit(MandobDialogFourthCheckBoxState());
  }

  void changeIndexRadioShipmentStates(var index) {
    CurrentIndexRadioShipmentStates = index;
    emit(MandobRadioButtonShipmentStatesState());
  }

  void changeIndexRadioShipmentReturn(var index) {
    CurrentIndexRadioShipmentReturn = index;
    emit(MandobRadioButtonShipmentReturnState());
  }

  bool isOpenDropDownShipmentState = false;

  void changeDropDownShipmentState() {
    isOpenDropDownShipmentState = !isOpenDropDownShipmentState;
    emit(MandobDropDownShipmentStatesState());
  }

  bool isOpenDropDownSelectReason = false;

  void changeDropDownSelectReason() {
    isOpenDropDownSelectReason = !isOpenDropDownSelectReason;
    emit(MandobDropDownSelectReasonState());
  }

  void changeIndex(int index, context) {
    CurrentIndex = index;
    if (CurrentIndex == 2)
      getAccountShipment();
    if (CurrentIndex == 1)
      getTodayDeliveries();
    if (CurrentIndex == 0) {
      getTotalShipment();
      getshipmentRepresentative(context);
    }
    emit(MandobBottomNavStyate());
  }

  ShipmentModel? shipmentModel;
  List<Map<String, dynamic>>? shipment;

  void getshipmentRepresentative(context) async {
    emit(LoadingshipmentStateState());
    var token = await SharedCashHelper.getValue(key: "token");
    DioHelper.getData(
        url: "api/mobile/shipmentRepresentative",
        authorization: "Bearer $token")
        .then((value) {
      print('B555555getshipmentRepresentative55555555: ${value.data}');
      shipmentModel = ShipmentModel.fromJson(value.data);
      emit(SuccessshipmentStateState());
    }).catchError((e) {
      print('Error Here>>>>>: ${e.response!.data}');
      if (e.response.data["status"] == "Token is Expired" ||
          e.response!.data["errors"]["status"] == "not active") {
        navigateAndFinsh(context, LoginScreen());
        SharedCashHelper.removeValue(key: "token");
        SharedCashHelper.removeValue(key: "imagePath");
      }
      emit(ErrorshipmentStateState());
    });
  }

  ShipmentStatusModel? shipmentStatusModel;
  List<Map<String, dynamic>>? ShipmentStatus;

  void getShipmentStatusModel() async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingStatuRepresentative());
    DioHelper.getData(
        url: "api/mobile/shipmentStatuRepresentative",
        authorization: "Bearer $token")
        .then((value) {
      print('B5555555555555555555555555555555: ${value.data}');
      shipmentStatusModel = ShipmentStatusModel.fromJson(value.data);
      print("^^^^^^^^^^^^  $token");
      print("^^^^^^SM^^^^^^  $shipmentStatusModel");
      if (kDebugMode) {
        print(value.toString());
      }
      if (kDebugMode) {
        print(
            " modelllll shepment 0 >>>>>>>>>>>   ${shipmentStatusModel!.shipmentStatuRepresentative![0].id}");
      }
      if (kDebugMode) {
        print("Map shipment = >>>>>>>>>>>>  ");
      }
      emit(SuccessStatuRepresentativeState());
    }).catchError((e) {
      print('Error Here>>>>: ${e.toString()}');
      emit(ErrorStatuRepresentativeState());
    });
  }

  TotalShipmentModel? totalShipmentModel;


  void getTotalShipment() async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingtotalshipmentStateState());
    DioHelper.getData(
        url: "api/mobile/totalGetShipmentRepresentative",
        authorization: "Bearer $token")
        .then((value) {
      print("B22>>>>>>>>>>totalShipment>>>>>>>>>>>>>>>>${value.data}");
      totalShipmentModel = TotalShipmentModel.fromJson(value.data);
      emit(SuccesstotalshipmentStateState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrortotalshipmentStateState());
    });
  }

  RepresentativeAccount? representativeAccount;

  void getAccountShipment() async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingAccountshipmentStateState());
    DioHelper.getData(
        url: "api/mobile/representative_account",
        authorization: "Bearer $token")
        .then((value) {
      print(" totalShipment : >>>>>>>>>>>Accountshipment>>>>>>>>>>>>>>>>${value
          .data}");
      representativeAccount = RepresentativeAccount.fromJson(value.data);


      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccessAccountshipmentStateState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorAccountshipmentStateState());
    });
  }

  TodayDeliveriesModel? todayDeliveriesModel;

  void getTodayDeliveries() async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingTodayDelivriesState());
    DioHelper.
    getData(
        url: "api/mobile/shipmentStatu6",
        authorization: "Bearer $token")
        .then((value) {
      print('B5>>>>>>>>shipmentStatu6>>>>>>>>>: ${value.data}');
      todayDeliveriesModel = TodayDeliveriesModel.fromJson(value.data);
      // shipment = value.data;
      print("^^^^^^^^^^^^  $token");
      print("^^^^^^todayDeliveriesModel^^^^^^  $todayDeliveriesModel");
      if (kDebugMode) {
        print(value.toString());
      }
      if (kDebugMode) {
        print(
            " shipmentStatu6 0 >>>>>>>>>>>   ${todayDeliveriesModel!
                .shipmentStatu6![0].id}");
      }
      if (kDebugMode) {
        print("Map shipment = >>>>>>>>>>>>  ");
      }
      emit(SuccessTodayDelivriesState());
    }).catchError((e) {
      print('Error Hhere>>>>: ${e.toString()}');
      emit(ErrorTodayDelivriesState());
    });
  }


  RepresenativeShipmentDetails? represenativeShipmentDetails;

  void getRepresenativeShipmentById(id) async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingRepresenativeShipmentIdState());
    DioHelper.getData(
        url: "api/mobile/detail/$id",
        authorization: "Bearer $token")
        .then((value) {
      represenativeShipmentDetails = RepresenativeShipmentDetails.fromJson(value.data);
      print(
          "totalShipment : >>>>>>>>>>>RepresenativeShipmentById>>>>>>>>>>>>>>>>$represenativeShipmentDetails");

      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccessRepresenativeShipmentIdState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorRepresenativeShipmentIdState());
    });
  }

  ReasonsModel? reasonsModel;

  void getReasons() async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingReasonsState());
    DioHelper.getData(
        url: "api/mobile/reason",
        authorization: "Bearer $token")
        .then((value) {
      reasonsModel = ReasonsModel.fromJson(value.data);
      print(
          "  totalShipment : >>>>>>>>>>>ReasonsModel>>>>>>>>>>>>>>>>$ReasonsModel");

      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccessReasonsState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorReasonsState());
    });
  }

  SearchModel ?searchModel;
  String ?erorrSearch;
  bool? isSearch = false;

  searchByIId(id) async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingshipmentStateStatesearch());

    try {
      Response response = await DioHelper.postData(
        accessToken: "",
        authorization: "Bearer $token",
        token: "",
        url: "api/mobile/shipmentRepresentativesearch",
        data: {
          "number_id": id,

        },
      );

      if (response.statusCode == 200) {
        searchModel = SearchModel.fromJson(response.data);
        isSearch = true;
        if (searchModel!.searchDate == null) {
          isSearch = false;
        }

        if (kDebugMode) {
          print("search =>>>>>> ${response.data}");
        }

        emit(SuccessshipmentStateStatesearch());
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response!.statusCode.toString());
        isSearch = false;
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }
      if (e.response!.statusCode == 422) {
        print(erorrSearch);
      }

      emit(ErrorshipmentStateStatesearch());
    }
    //  DioHelper.postData(url: LOGIN, data: {
    //   'phone_number': phoneController.text,
    //   'password': passwordController.text,
    // },token: "", accessToken: '', authorization: '',).then((value) {
    //   print(value.data);
    //
    //   loginModel =  UserDataModel.fromJson(value.data);
    //
    //   SharedCashHelper.setValue(value: loginModel.accessToken, key: 'token', ).then((value) {
    //
    //
    //     token= loginModel.accessToken! ;
    //   });
    //   // log(SharedCashHelper.getValue(key: "token"));
    //   emit(LoginSuccessState());
    // }).catchError((e) {
    //
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    //   emit(LoginErrorState(e.toString()));
    // }
    // ) ;


  }

  FilterModel ?filterModel;
  bool? isFilter = false;

  filterByStatus(id) async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingshipmentStateStateFilter());

    try {
      Response response = await DioHelper.postData(
        accessToken: "",
        authorization: "Bearer $token",
        token: "",
        url: "api/mobile/shipmentStatuFilter",
        data: {
          "status": id,

        },
      );

      if (response.statusCode == 200) {
        filterModel = FilterModel.fromJson(response.data);
        isFilter = true;


        if (kDebugMode) {
          print("search =>>>>>> ${response.data}");
        }


        emit(SuccessshipmentStateStatesearch());
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response!.statusCode.toString());
        isSearch = false;
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }
//      if (e.response!.statusCode == 422) {
//        if (e.response!.data["errNum"] == "0") {
//          erorrSearch = "";
//        }
//        emit(ErrorshipmentStateStatesearch());
//        print(erorrSearch);
//      }

      emit(ErrorshipmentStateStateFilter());
    }
    //  DioHelper.postData(url: LOGIN, data: {
    //   'phone_number': phoneController.text,
    //   'password': passwordController.text,
    // },token: "", accessToken: '', authorization: '',).then((value) {
    //   print(value.data);
    //
    //   loginModel =  UserDataModel.fromJson(value.data);
    //
    //   SharedCashHelper.setValue(value: loginModel.accessToken, key: 'token', ).then((value) {
    //
    //
    //     token= loginModel.accessToken! ;
    //   });
    //   // log(SharedCashHelper.getValue(key: "token"));
    //   emit(LoginSuccessState());
    // }).catchError((e) {
    //
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    //   emit(LoginErrorState(e.toString()));
    // }
    // ) ;


  }

  int CurrentIndexRadioButton = 5;

  void changeRadioButton(value) {
    CurrentIndexRadioButton = value;
    emit(RadioButtonState());
  }


  NoteModel ?noteModel;
  var rejectText=TextEditingController();
  var cancelationText=TextEditingController();
  updateShipmentRepresentative(context,id,{note, date, return_price, shipment_status_id, count_product, return_count_product, store_id}) async {
    var token = await SharedCashHelper.getValue(key: "token");

    try {
      Response response = await DioHelper.postData(
        accessToken: "",
        authorization: "Bearer $token",
        token: "",
        url: "api/mobile/updateshipmentRepresentative/$id",
        data: {
          "shipment_status_id": shipment_status_id,
          "store_id": store_id,
          "status_return": CurrentIndexRadioShipmentReturn,
          "date": date,
          "note": note,
          "count_product": count_product,
          "return_count_product": return_count_product,
          "return_price": return_price,
        },
      );

      if (response.statusCode == 200) {
        noteModel = NoteModel.fromJson(response.data);
        getshipmentRepresentative(context);
         CurrentLocation=null;
        cancelationText.clear();
        rejectText.clear();
         SharedCashHelper.removeValue(key: "CurrentLocation");
        if (kDebugMode) {
          print("note =>>>!!!!>>> ${response.data}");
        }
        emit(SuccessshipmentStateAddNotes());
      }
      emit(SuccessshipmentStateAddNotes());
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response!.statusCode.toString());
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }

      emit(ErrorshipmentStateAddNotes());
    }
  }

  StoreModel? storeModel;
  int? idOfStore;
  List StoriesList = [];

  void getStories() async {
    var token = await SharedCashHelper.getValue(key: "token");
    DioHelper.getData(
      authorization: "Bearer ${token}",
      url: "api/mobile/getCStore",
    )
        .then((value) {
      print('B11>>>>>>>>getStories>>>>>>>>>:${value.data}');
      storeModel = StoreModel.fromJson(value.data);
      storeModel!.store!.forEach((element) {
        StoriesList!.add(element);
      });
      emit(SuccessGetStoriesState());
    }).catchError((erorr) {
      print(erorr);
      emit(ErorrGetStoriesState());
    });
  }

  String completeShowMsg = "";
  DateTime? date;
  String stringDate = "";

  void convertDateToString() {
    if (stringDate == "") {
      completeShowMsg = "برجاء تحديد تاريخ الوصول";
      emit(ShowErrorMsgInSnackBar());
    }
    stringDate = DateFormat("y-MM-dd").format(date!);
    log("stringDate:>${stringDate}");
    emit(ConvertDateToString());
  }

  void getDate({required DateTime myDate}) {
    date = myDate;
    log("date:>${date}");
    convertDateToString();
    emit(GetDateAndShowIt());
  }

  //////////////////////////////Notifactions/////////////////////////////////
  NotifactionsModel? notifactionsModel;

  void getNotifactions() async {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingNotificationStateState());
    try {
      DioHelper.getData(
          url: "api/mobile/notification_representative",
          authorization: "Bearer ${token}").then((value) {
        notifactionsModel = NotifactionsModel.fromJson(value.data);
        log("oooooooooo(((getNotifactions)))aaaaaaaaaaaaa ${value.data
            .toString()}");
        emit(SucessNotificationStateState());
      });
    }
    on DioError catch (error) {
      log(error.toString());
      emit(ErorrNotificationStateState());
    }
  }

  //////////////////////////////Maps/////////////////////////////////
  StreamSubscription? streamSubscription;
  GoogleMapController? googleMapController;
  Location liveLocation = Location();
  Marker? myMarker;
  Circle? mycircle;

  String? CurrentLocation;
  LatLng? newlatLng;
  LatLng? CurrentlatLng;
  MapModel? mapModel;



  setCurrentLocation({currentLocation, id}) async {
    var token = await SharedCashHelper.getValue(key: "token");
    try {
      Response response = await DioHelper.postData(
        accessToken: "",
        authorization: "Bearer ${token}",
        token: "",
        url: "api/mobile/create_map/$id",
        data: {
          "distance": currentLocation,
        },
      );
      if (response.statusCode == 200) {
        mapModel = MapModel.fromJson(response.data);
        log("!!!!!!!!!###>$mapModel");

        if (kDebugMode) {
          print("Map =>>>!!!!>>> ${response.data}");
        }
      }
      emit(SucessGetCurrentLocation());
    } on DioError catch (e) {
      if (kDebugMode) {
        print("QQQQ${e.response!.statusCode.toString()}");
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }
      emit(ErorrGetCurrentLocation());
    }
  }



  void navigateTo(double lat, double lng) async {
    var uri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    if (await canLaunchUrlString(uri.toString())) {
      await launchUrlString(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
  
  // void getPlaces(String place,String sessionToken)
  // {
  //   DioHelper.getMapData(
  //       url: "api/place/autocomplete/json",
  //       data: {
  //           "input":place,
  //           "types":"address",
  //           "components":"country:eg",
  //           "key":"AIzaSyDBDMV0vw-A3f58PW2eNLCxFjldwUIgGhQ",
  //           "sessiontoken":sessionToken,
  //       }
  //
  //   )
  //       .then((value) {
  //     print('B555555getshipmentRepresentative55555555: ${value.data}');
  //     shipmentModel = ShipmentModel.fromJson(value.data);
  //     //emit(SuccessshipmentStateState());
  //   }).catchError((e) {
  //     print('Error Here: ${e.toString()}');
  //    // emit(ErrorshipmentStateState());
  //   });
  // }

  LatLng? latLongTemp ;
  LatLng? latLongOld  ;
  LatLng? latLongNew  ;
  DistanceModel? distanceModel;
  num? totalDistance;
  num? distanceNow  ;
  Future<void> getCurrentLocation({index,id}) async {

    try {
      var location = await liveLocation.getLocation();
      print("Lat:${location.latitude},Long:${location.longitude}");
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': location!.latitude,
        'longitude': location!.longitude,
        'name': 'MoAmr'
      }, SetOptions(merge: true));
      CurrentLocation = "${location.latitude},${location.longitude}";
      SharedCashHelper.setValue(key: "CurrentLocation", value: CurrentLocation);
      CurrentlatLng= LatLng(location.latitude!, location.longitude!);
      setCurrentLocation(currentLocation: "${CurrentlatLng!.latitude},${CurrentlatLng!.longitude}",id: id);
      latLongNew = CurrentlatLng ;
        getTotalDistance(index);
      if (streamSubscription != null) {
        streamSubscription!.cancel();
      }
      streamSubscription = liveLocation.onLocationChanged.listen((newLocation)async {

        newlatLng = LatLng(newLocation.latitude!, newLocation.longitude!);
        await FirebaseFirestore.instance.collection('location').doc('user1').set({
          'latitude': newlatLng!.latitude,
          'longitude': newlatLng!.longitude,
          'name': 'MoAmr'
        }, SetOptions(merge: true));
        latLongOld = latLongNew ;
        latLongTemp = newlatLng ;
        latLongNew = latLongTemp ;

        if(latLongNew != latLongOld)
          {
            print("Newwwwww$newlatLng");
            getDistanceNow(index: index,id: id);
          }

      });

     /* Timer.periodic(Duration(minutes: 1), (timer) {
        print("After 1 min$newlatLng");
       // getDistanceMatrix(id: id,index: index);


      });*/
      emit(SucessGetCurrentLocation());
    } on PlatformException catch (e) {
      print(e.message);
      emit(ErorrGetCurrentLocation());
    }
  }

  void getTotalDistance(index) async {
    try {
      print("XXXXZZZZ");
      //${double.parse(shipmentModel!.shipmentRepresentative![index].endMap![0])}
      var response = await Dio().get('https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${CurrentlatLng!.latitude},${CurrentlatLng!.longitude}&origins=${double.parse(shipmentModel!.shipmentRepresentative![index].endMap![0])},${double.parse(shipmentModel!.shipmentRepresentative![index].endMap![1])}&key=${GOOGLE_APIKEY}');
      distanceModel=DistanceModel.fromJson(response.data);
      totalDistance=distanceModel!.rows![0].elements![0].distance!.value;
      print("totalDistance>>${totalDistance}");
    } catch (e) {
      print(e);
    }
  }

  void getDistanceNow({index,id}) async {
    try {
      print("XXXXZZZZ");
      //${double.parse(shipmentModel!.shipmentRepresentative![index].endMap![0])}
      var response = await Dio().get('https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${newlatLng!.latitude},${newlatLng!.longitude}&origins=${double.parse(shipmentModel!.shipmentRepresentative![index].endMap![0])},${double.parse(shipmentModel!.shipmentRepresentative![index].endMap![1])}&key=${GOOGLE_APIKEY}');
      distanceModel=DistanceModel.fromJson(response.data);
      distanceNow =distanceModel!.rows![0].elements![0].distance!.value;
          print("distanceNow>>${distanceNow}");
      print("MMMM>>>${1 -  num.parse((distanceNow! / totalDistance!).toStringAsFixed(2))}");
       if(1 -  num.parse((distanceNow! / totalDistance!).toStringAsFixed(2)) == 0.25)
         {
          setCurrentLocation(currentLocation: "${newlatLng!.latitude},${newlatLng!.longitude}",id: id);
         //  invoke function That Tell BackEnd This is Quarter of The Distance
         }else if (1 - num.parse((distanceNow! / totalDistance!).toStringAsFixed(2)) == 0.50)
          {
            setCurrentLocation(currentLocation: "${newlatLng!.latitude},${newlatLng!.longitude}",id: id);
            //  invoke function That Tell BackEnd This is half of The Distance
          }else if (1 -  num.parse((distanceNow! / totalDistance!).toStringAsFixed(2)) == 0.75)
            {
              setCurrentLocation(currentLocation: "${newlatLng!.latitude},${newlatLng!.longitude}",id: id);
              //  invoke function That Tell BackEnd This is 0.75 of The Distance
            }else if (1 -  num.parse((distanceNow! / totalDistance!).toStringAsFixed(0)) == 0.0)
              {
              //  The Representative Has Arrived Besalama
                setCurrentLocation(currentLocation: "${newlatLng!.latitude},${newlatLng!.longitude}",id: id);
              }
      print("QQ?${response.data}");
    } catch (e) {
      print(e);
    }
  }


  ///chats func<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>><><<<<<>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  RepresentativeModel? representativeData;

  void sendMessage({
    required String text,
    required int? receiverId,
    required String datetime,
  }) {
    MessageModel model = MessageModel(text: text,
        receiveruId: receiverId,
        senderuId: SharedCashHelper.getValue(key: "UserId"),
        dateTime: datetime);
    FirebaseFirestore
        .instance
        .collection("users")
        .doc(SharedCashHelper.getValue(key: "UserId").toString())
        .collection("chat")
        .doc(receiverId.toString())
        .collection("messages")
        .add(model.toMap())
        .then((value) {
      emit(SucessSendMessageState());
    })
        .catchError((erorr) {
      emit(ErorrSendMessageState());
    });
    FirebaseFirestore
        .instance
        .collection("users")
        .doc(receiverId.toString())
        .collection("chat")
        .doc(SharedCashHelper.getValue(key: "UserId").toString())
        .collection("messages")
        .add(model.toMap())
        .then((value) {
      emit(SucessSendMessageState());
    })
        .catchError((erorr) {
      emit(ErorrSendMessageState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({required String? receiverId}) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(SharedCashHelper.getValue(key: "UserId").toString())
        .collection("chat")
        .doc(receiverId)
        .collection("messages")
        .orderBy("dateTime", descending: true)
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessagesSucessState());
    });
  }

  void sendVerificationCode(phone)
  {
    log("sendVerificationCode>>${phone}");
    DioHelper.dioSMS!.post("sms/api/otp-send",data:
        {
          "username": "Bolt",
          "password": "Bolt@123",
          "sender": "Bolt",
           "mobile": "2${SharedCashHelper.getValue(key: "ClientPhone")}",
        }).
    then((value) => print('B11>>>>>>>>getOTP>>>>>>>>>:${value.data}') );
  }

  void sendMessageSMS(phone)
  {
    log("sendMessageSMS>>${phone}");
    DioHelper.dioSMS!.get("sms/api",queryParameters:
    {
      "username": "Bolt",
      "password": "Bolt@123",
      "sendername": "Bolt",
      "mobiles": "2${phone}",
      "message":"yy"
    }).
    then((value) => print('B11>>>>>>>>getSMS>>>>>>>>>:${value.data}') );
  }


}
