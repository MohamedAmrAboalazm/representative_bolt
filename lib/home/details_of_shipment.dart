import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:representative_bolt/colors.dart';
import 'package:representative_bolt/components/bloc/cubit/cubit.dart';
import 'package:representative_bolt/components/items.dart';
import 'package:representative_bolt/components/sharedpref/shared_preference.dart';
import 'package:representative_bolt/home/change_status_of_shipment.dart';
import 'package:representative_bolt/sms/sms_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/bloc/cubit/states.dart';
import '../main_nav_screen/mandob_layout.dart';
import '../models/representative_shipment_id.dart';
import 'mandob_first_screen.dart';

class DetailsOfShipment extends StatelessWidget {

  int? itemIndex;
  dynamic model;
  final formKeyValidate = GlobalKey<FormState>();
  DetailsOfShipment(this.itemIndex,this.model);

  @override
  Widget build(BuildContext context) {
    var notesController=TextEditingController();

    return BlocConsumer<MandobCubit, MandobStates>(

  listener: (context, state) {
    // TODO: implement listene

  },

  builder: (context, state) {

    var cubit = MandobCubit.get(context);
         SharedCashHelper.setValue(key: "ClientPhone", value: model.client!.phone);
      return  Scaffold(
          appBar: customAppBar(context, imageTitle: "assets/icons/noun-shipping-3484992.svg", imageAction: "assets/icons/menu.svg", text: "تفاصيل الشحنة"),
          body: ConditionalBuilder(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultText(text: "شحنة",fontSize:25),
                      defaultText(text: "(${model.id})",fontSize:20),
                    ],
                  ),
/*                  defaultButtonWithIcon(context, text: "دردشه", image:  "assets/icons/noun-talk-4679128.svg", onPressed: (){
                    showToast(message: "SOOOOON", state: ToastStates.SUCCES);
                  }, widthButton: .6, borderRadius: 25, colorText: Colors.white, colorImage: Colors.white, colorButtom: purple,bottomMargin:15,hightIcon:.05,widthIcon:.05, hightButton: .1),*/
                  CardItem(buildYourContainer:
                  Stack(
                    alignment:AlignmentDirectional.center,
                    children: [
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:45),
                            child: Divider(thickness: 2,color:Colors.grey,),
                          )),
                      Row(

                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                if(model.shipmentstatu!.id!>=1)
                                  Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.createdAt}"))}",style: TextStyle(fontSize:10,color:purple)),
                                const SizedBox(height: 5,),
                                Container(
                                  width:35,
                                  height:35,
                                  decoration:  BoxDecoration(
                                    color: model.shipmentstatu!.id!>=1? purple:Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,size: 22,color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                 if(model.shipmentstatu!.id!>=1)
                                  Text("Picked",style: TextStyle(fontSize:10,color:purple)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                if(model.shipmentstatu!.id!>=3)
                                  Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.createdAt}"))}",style: TextStyle(fontSize:10,color:purple)),
                                const SizedBox(height: 5,),
                                Container(
                                  width:35,
                                  height:35,
                                  decoration:  BoxDecoration(
                                    color: model.shipmentstatu!.id!>=3 ? purple:Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,size: 22,color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                if(model.shipmentstatu!.id!>=3)
                                  Text("Out of delivery",style: TextStyle(fontSize:10,color:purple)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                if(model.shipmentstatu!.id!>=4)
                                  Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.createdAt}"))}",style: TextStyle(fontSize:10,color:purple)),
                                SizedBox(height: 5,),
                                Container(
                                  width:35,
                                  height:35,
                                  decoration: BoxDecoration(
                                    color: model.shipmentstatu!.id!>=4 ? purple:Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,size: 22,color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                if(model.shipmentstatu!.id!>=4)
                                  Text("${model.shipmentstatu!.name}",style: TextStyle(fontSize:10,color:purple)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                      hightCard: .18,marginBottom: 0,marginEnd: 20,marginStart: 20,marginTop: 0),
                  CardItem(buildYourContainer: Column(
                    children: [
                      Row(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20),
                          //   child: SvgPicture.asset("assets/icons/noun-qr-1474708.svg",
                          //       height:  MediaQuery.of(context).size.height*.15,
                          //   ),
                          // ),
                          QrImage(
                            data: "'أسم الشحنه': '${model.nameShipment}'\n, 'أسم العميل': '${model.client!.name}'",
                            version: QrVersions.auto,
                            size: 140.0,
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailsOfShippingItem(context,text:"مسموح بفتح الشحنة ",),
                              DetailsOfShippingItemWithData(name: "أسم التاجر",text:"${model.user!.userData!.name}",colorData: black,
                                  ShippingWidth: .22,isExistIcons: false),
                              DetailsOfShippingItemWithData(name: "كود التاجر",text:"${model.user!.userData!.userId}",colorData: black,
                                  ShippingWidth: .22,isExistIcons: false),
                              DetailsOfShippingItemWithData(name: "عنوان التاجر",text:"${model.user!.userData!.address} ",colorData: black,
                                  ShippingWidth: .22,isExistIcons: false),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if(model.shipmentStatusId==3&&SharedCashHelper.getValue(key: "CurrentLocation")!=null)
                          Padding(
                            padding:  EdgeInsetsDirectional.only(start: 10),
                            child: defaultButton(context, text: "إلغاء", onPressed: (){
                              showDialog(
                                  context: context,
                                  builder:(BuildContext context){
                                    return Form(
                                      key: formKeyValidate,
                                      child: CustomTextFormDialog(
                                          heightDialog: 3.5.h,
                                          containerofdata: Column(
                                            children: [
                                              SizedBox(height: 2.h,),
                                              CustomTextFormField(
                                                marginRight: 2.h,marginLeft: 2.h,marginTop:1.h,marginbottom:.3.h,
                                                validator: (v){
                                                  if (v!.isEmpty) {
                                                    return "أدخل سبب الالغاء";
                                                  }
                                                },
                                                hintText: "سبب الالغاء",
                                                maxLines: 1,
                                                keyboardtype: TextInputType.text,
                                                controller: cubit.rejectText,

                                              ),
                                              Padding(
                                                padding:  EdgeInsetsDirectional.only(top:1.h,end:8.1.h,start: 2.h,bottom: 1.h),
                                                child: CustomDropDownButton(hint: 'أختر المخزن',itemList:  cubit.StoriesList,textValidation:  'أختر المخزن',
                                                    onChanged: (value) {
                                                      cubit.idOfStore=value.id;
                                                      log("AAA?>${cubit.idOfStore}");
                                                    }),
                                              ),
                                              SizedBox(height: 2.h,),
                                              defaultButton(context, text: "تأكيد", onPressed: (){
                                                if(formKeyValidate.currentState!.validate())
                                                  {
                                                    MandobCubit.get(context).updateShipmentRepresentative(context,model.id,shipment_status_id: 7,note: cubit.cancelationText.text,store_id:cubit.idOfStore);
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    cubit.cancelationText.clear();
                                                  }

                                              }, widthButton: .3, borderRadius: 8, colorButton: Colors.red),
                                            ],
                                          )),
                                    );
                                  }
                              );
                            }, widthButton:.2, borderRadius: 25, colorButton: Colors.red),
                          ),
                          Spacer(),
                          defaultButton(context, text: "فتح العنوان علي الخريطه", onPressed: (){
                            cubit.navigateTo(double.parse(cubit.shipmentModel!.shipmentRepresentative![itemIndex!]!.endMap![0]), double.parse(cubit.shipmentModel!.shipmentRepresentative![itemIndex!]!.endMap![1]));
                          }, widthButton:.3, borderRadius: 25, colorButton: purple),
                        ],
                      ),

                    ],
                  ), hightCard: .23,marginBottom: 20,marginEnd: 20,marginStart: 20,marginTop: 20),
                  CardItem(buildYourContainer: DetailsOfShippingItemWithData(name:"المرسل اليه",text:"${model.client!.name}",colorData:black, ShippingWidth: .22,isExistIcons: false),
                      hightCard: .1,marginBottom:20,marginTop: 0,marginStart:20,marginEnd: 20),
                  CardItem(buildYourContainer:SingleChildScrollView(
                    child: Column(
                      children: [
                        DetailsOfShippingItemWithData(
                          name: "عنوان الشحنة",
                          text: "${model.client!.address}",
                          colorData: purple,
                          ShippingWidth: .32,
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          onTapPhone: (){
                            launchFromUrl("tel:${model.client!.phone}");
                          },
                          onTapWhatsapp: (){
                            launchFromUrl("https://wa.me/+2${model.client!.phone}");
                          },
                          onTapMessage: (){
                            navigateTo(context,  SmsScreen(model.client!.phone),);
                          },
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "الموبايل 1",
                          text: "${model.client!.phone}",
                          isExistIcons: true,
                        ),
                        if(!(model.client!.phone2==null))
                        DetailsOfShippingItemWithData(
                            onTapPhone: (){
                              launchFromUrl("tel:${model.client!.phone2}");
                            },
                            onTapWhatsapp: (){
                              launchFromUrl("https://wa.me/+2${model.client!.phone2}");
                            },
                            onTapMessage: (){
                              navigateTo(context,  SmsScreen(model.client!.phone2),);
                            },
                            colorData: purple,
                            ShippingWidth: .32,
                            name: "الموبايل 2",
                            text: "${model.client!.phone2}",
                            isExistIcons: true,
                          ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "اسم المنتج",
                          text: "${model.nameShipment}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "العدد",
                          text: "${model.count} ",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "الوزن",
                          text: "${model.weight}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "الحجم",
                          text: "${model.size}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "وصف المنتج",
                          text: "${model.description}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "ملاحظات",
                          text: "${model.notes}",
                          isExistIcons: false,
                        ),
                      ],),),hightCard:.4, marginTop: 0, marginEnd: 20, marginBottom: 20, marginStart: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => represenativeShipmentIdItem(context,cubit.represenativeShipmentDetails!.detali![index], index),
                    itemCount: cubit.represenativeShipmentDetails!.detali!.length,

                  ),
                  if(model.shipmentStatusId<=3)
                    defaultButtonWithIcon(context,hightButton: .1,colorButtom: yellow,borderRadius:30,colorImage:black,colorText:black,widthButton: .8,onPressed: (){
                      navigateTo(context, ChangeStatusOfShipment(itemIndex));
                      }
                        ,text: "تعديل حالة الشحنة", image: "assets/icons/noun-packing-1914671.svg",leftMargin: 0,rightMargin: 0,topMargin: 0,bottomMargin:15,hightIcon:.05,widthIcon: .05),

                ],
              ),
            ),
            fallback:  (context) => Center(child: CircularProgressIndicator()),
            condition: model!=null&&cubit.represenativeShipmentDetails!=null,
          )

      );
  },
);
  }
//  static void launchFromUrl(String url) async {
//    bool result = await canLaunchUrl(Uri.parse(url));
//    if (result) {
//        await launchUrl(Uri.parse(url));
//    } else {
//      log("Can't launch $url");
//    }
//  }
  static void launchFromUrl(String url) async {
    bool result = await canLaunch(url);
    if (result) {
      await launch(url);
    } else {

      log("Can't launch $url");
    }
  }
}

represenativeShipmentIdItem(context, Detali model, index) {

  return CardItem(buildYourContainer: SingleChildScrollView(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsOfShippingItem(context,text:"${model.shipmentstatu!.name}",),
            DetailsOfShippingItemWithData(name: "اسم المندوبأ",text:"${model.user!.userData!.name}",colorData: black,
                ShippingWidth: .22,isExistIcons: false),
            DetailsOfShippingItemWithData(name: "رقم المندوب",text:"${model.user!.phoneNumber}",colorData: black,
                ShippingWidth: .22,isExistIcons: false),

          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.createdAt}"))}"),
              Text("${DateFormat.jm().format(DateTime.parse("${model.createdAt}"))}"),

            ],
          ),
        ),
      ],
    ),
  ), hightCard: .16,marginBottom: 20,marginEnd: 20,marginStart: 20,marginTop: 0);
}

