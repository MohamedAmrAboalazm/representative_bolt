import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:representative_bolt/components/items.dart';
import 'package:representative_bolt/home/details_of_shipment.dart';
import 'package:representative_bolt/home/mandob_first_screen.dart';
import 'package:representative_bolt/main_nav_screen/mandob_layout.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';
import '../components/bloc/cubit/cubit.dart';
import '../components/bloc/cubit/states.dart';
import '../constants/themes.dart';
import '../models/reasons_model.dart';

class ChangeStatusOfShipment extends StatelessWidget {
  int? itemIndex;

  ChangeStatusOfShipment(this.itemIndex);

  @override
  Widget build(BuildContext context) {
    var notesController=TextEditingController();
    var priceController=TextEditingController();
    var countProduct=TextEditingController();
    var returnCountProduct=TextEditingController();
    final formKeyValidate = GlobalKey<FormState>();
    return BlocConsumer<MandobCubit,MandobStates>(
     listener: (context, state) {
       if(state is SuccessshipmentStateAddNotes) {
         showToast(message:"تم تعديل حاله الشحنه", state: ToastStates.SUCCES);
         notesController.clear();
         priceController.clear();
         countProduct.clear();
         returnCountProduct.clear();
         MandobCubit.get(context).stringDate="";
         MandobCubit.get(context).getshipmentRepresentative(context);
         navigateAndFinsh(context,MandobLayout());
       }
     },
      builder: (context,state){
        var cubit = MandobCubit.get(context);
       return Scaffold(
         appBar: customAppBar(context, imageTitle: "assets/icons/noun-shipping-3484992.svg", imageAction: "assets/icons/menu.svg", text: "تفاصيل الشحنة"),
         body:  SingleChildScrollView(
           child: Form(
             key: formKeyValidate,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     defaultText(text: "شحنة",fontSize:25),
                     defaultText(text: "(${cubit.shipmentModel!.shipmentRepresentative![itemIndex!].id})",fontSize:20),
                   ],
                 ),
                 SizedBox(height: 20,),
                 CustomHeadOfDropDown( textOfHead:"أختر حالة الشحنة",isShipmentState:true),
                 if(cubit.isOpenDropDownShipmentState)
                  ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder:(context, index) => CustomListOfDropDown(textList:"${cubit.shipmentStatusModel!.shipmentStatuRepresentative![index].name}",indexRadio: index,isShipmentStates: true),
                   itemCount: cubit.shipmentStatusModel!.shipmentStatuRepresentative!.length,
                 ),
               /*  if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "Picked")
                   Padding(
                     padding:  EdgeInsetsDirectional.only(top:1.h,end:8.1.h,start: 2.h,bottom: 1.h),
                     child: CustomDropDownButton(hint: 'أختر المخزن',itemList:  cubit.StoriesList,textValidation:  'أختر المخزن',
                         onChanged: (value) {
                           cubit.idOfStore=value.id;
                           log("AAA?>${cubit.idOfStore}");
                         }),
                   ),*/
                 if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "Reject")
                   Column(
                     children: [
                       Padding(
                         padding:  EdgeInsetsDirectional.only(top:1.h,end:8.1.h,start: 2.h,bottom: 1.h),
                         child: CustomDropDownButton(hint: 'أختر المخزن',itemList:  cubit.StoriesList,textValidation:  'أختر المخزن',
                             onChanged: (value) {
                              cubit.idOfStore=value.id;
                              log("AAA?>${cubit.idOfStore}");
                             }),
                       ),
                      /* Padding(
                         padding:  EdgeInsetsDirectional.only(end: 2.h,start: 3.h),
                         child: Row(
                           children: [
                             Text("${cubit.returnText}",style: TextStyle(fontSize: 10.sp)),
                             SizedBox(width: 5.h,),
                             FlutterSwitch(
                               height: 3.h,
                               width: 8.h,
                               padding: 4.0,
                               toggleSize: 15.0,
                               borderRadius: 20,
                               activeColor: purpleColor,
                               value:cubit.isReturn,
                               onToggle: (value) {
                                 cubit.changeBreakableState(value);
                               },
                             ),
                           ],
                         ),
                       ),*/
                         Padding(
                           padding:  EdgeInsetsDirectional.only(top:.5.h,start: 2.h,bottom: .5.h),
                           child: Row(children: [
                             Row(
                               children: [
                                 Radio(
                                   value:false,
                                   onChanged: (s)
                                   {
                                     cubit.changeIndexRadioShipmentReturn(s);
                                   },
                                   groupValue:cubit.CurrentIndexRadioShipmentReturn,
                                 ),
                                 Text(
                                     "مرتجع غير مسدد قيمة الشحن",style: TextStyle(fontSize: 9.sp,color:purple)
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Radio(
                                   value:true,
                                   onChanged: (s)
                                   {
                                     cubit.changeIndexRadioShipmentReturn(s);
                                   },
                                   groupValue:cubit.CurrentIndexRadioShipmentReturn,
                                 ),
                                 Text(
                                     "مرتجع  مسدد قيمة الشحن",style: TextStyle(fontSize: 9.sp,color:purple)
                                 ),
                               ],
                             ),
                           ],),
                         ),
                       CustomTextFormField(controller:notesController,hintText: "ملاحظاتك",validator: (value){
                         if (value!.isEmpty) {
                           return "ملاحظاتك";
                         }
                       }, maxLines: 4,marginBottom: 20,marginTop: 10),
                     ],
                   ),
                 if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "Rescheduled")
                   Column(
                     children: [
                       Padding(
                         padding:  EdgeInsetsDirectional.only(top:1.h,end:8.1.h,start: 2.h,bottom: 1.h),
                         child: CustomDropDownButton(hint: 'أختر المخزن',itemList:  cubit.StoriesList,textValidation:  'أختر المخزن',
                             onChanged: (value) {
                               cubit.idOfStore=value.id;
                               log("AAA?>${cubit.idOfStore}");
                             }),
                       ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(2025, 6, 7),
                                      onChanged: (date) {
                                        log('change $date');
                                      },
                                      onConfirm: (date) {
                                        cubit.getDate(myDate: date);
                                      },
                                      currentTime: DateTime.now(),
                                    );
                                  },
                                  child: Container(
                                    height: 6.h,
                                    width: 25.w,
                                    margin: EdgeInsetsDirectional.only(start: 1.6.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: purpleColor,
                                      borderRadius:
                                      const BorderRadiusDirectional
                                          .horizontal(
                                        start: Radius.circular(10.0),
                                        end: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'تاريخ تأجيل الشحنة',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.h,vertical: .5.h),
                                      height: 6.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: purpleColor),
                                        borderRadius:
                                        const BorderRadiusDirectional
                                            .horizontal(
                                          start: Radius.circular(10.0),
                                          end: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: cubit.stringDate == ""
                                          ? Text("لم يتم تحديد تاريخ الوصول بعد",
                                        style: TextStyle(
                                            color: textGreyTwoColor,
                                            fontSize: 15.0),
                                        textAlign: TextAlign.center,
                                      )
                                          : Text(
                                        DateFormat("y-MM-dd")
                                            .format(cubit.date!),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 18.0),
                                        textAlign: TextAlign.center,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                       CustomTextFormField(controller:notesController,hintText: "ملاحظاتك",validator: (value){
                         if (value!.isEmpty) {
                           return "ملاحظاتك";
                         }
                       }, maxLines: 4,marginBottom: 20,marginTop: 10),
                     ],
                   ),
                 if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "Confirm Received By Client")
                   Column(
                     children: [
                       Padding(
                         padding:  EdgeInsetsDirectional.only(top:1.h,end:8.1.h,start: 2.h,bottom: 1.h),
                         child: CustomDropDownButton(hint: 'أختر المخزن',itemList:  cubit.StoriesList,textValidation:  'أختر المخزن',
                             onChanged: (value) {
                               cubit.idOfStore=value.id;
                               log("AAA?>${cubit.idOfStore}");
                             }),
                       ),
                       Padding(
                         padding:  EdgeInsetsDirectional.only(top:.5.h,start: 2.h,bottom: .5.h),
                         child: Row(children: [
                           Row(
                             children: [
                               Radio(
                                 value:false,
                                 onChanged: (s)
                                 {
                                   cubit.changeIndexRadioShipmentReturn(s);
                                 },
                                 groupValue:cubit.CurrentIndexRadioShipmentReturn,
                               ),
                               Text(
                                   "مرتجع غير مسدد قيمة الشحن",style: TextStyle(fontSize: 9.sp,color:purple)
                               ),
                             ],
                           ),
                           Row(
                             children: [
                               Radio(
                                 value:true,
                                 onChanged: (s)
                                 {
                                   cubit.changeIndexRadioShipmentReturn(s);
                                 },
                                 groupValue:cubit.CurrentIndexRadioShipmentReturn,
                               ),
                               Text(
                                   "مرتجع  مسدد قيمة الشحن",style: TextStyle(fontSize: 9.sp,color:purple)
                               ),
                             ],
                           ),
                         ],),
                       ),
                       CustomTextFormField(controller:notesController,hintText: "ملاحظاتك",validator: (value){
                         if (value!.isEmpty) {
                           return "ملاحظاتك";
                         }
                       }, maxLines: 4,marginBottom: 20,marginTop: 10),

                     ],
                   ),
                 if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "Other")
                   Column(
                     children: [
                       Padding(
                         padding:  EdgeInsetsDirectional.only(top:1.h,end:8.1.h,start: 2.h,bottom: 1.h),
                         child: CustomDropDownButton(hint: 'أختر المخزن',itemList:  cubit.StoriesList,textValidation:  'أختر المخزن',
                             onChanged: (value) {
                               cubit.idOfStore=value.id;
                               log("AAA?>${cubit.idOfStore}");
                             }),
                       ),
                       CustomTextFormField(controller:priceController,hintText: "سعر المنتجات",validator: (value){
                         if (value!.isEmpty) {
                           return "سعر المنتجات";
                         }
                       }, maxLines: 1,marginBottom: 0,marginTop: 0),
                       CustomTextFormField(controller:countProduct,hintText: "عدد المنتجات المسلمة",validator: (value){
                         if (value!.isEmpty) {
                           return "عدد المنتجات المسلمة";
                         }
                       }, maxLines: 1,marginBottom: 0,marginTop: 10),
                       CustomTextFormField(controller:returnCountProduct,hintText: "عدد المنتجات المستلمة",validator: (value){
                         if (value!.isEmpty) {
                           return "عدد المنتجات المستلمة";
                         }
                       }, maxLines: 1,marginBottom: 0,marginTop: 10),
                       CustomTextFormField(controller:notesController,hintText: "ملاحظاتك",validator: (value){
                         if (value!.isEmpty) {
                           return "ملاحظاتك";
                         }
                       }, maxLines: 4,marginBottom: 20,marginTop: 10),
                     ],
                   ),
                 SizedBox(height: 1.h,),
                 Center(child: defaultButton(context,colorButton: purple,text: "تأكيد", onPressed: (){
                   if(cubit.stringDate==""&&cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "Rescheduled"){

                     showToast(message:"برجاء تحديد تاريخ الوصول", state: ToastStates.ERORR);
                   }
                  else if(formKeyValidate.currentState!.validate())
                     {
                       cubit.updateShipmentRepresentative(context,
                         cubit.shipmentModel!.shipmentRepresentative![itemIndex!].id,
                         store_id: cubit.idOfStore,
                         date: cubit.stringDate,
                         note:  notesController.text,
                         return_price:priceController.text,
                         count_product: countProduct.text,
                         return_count_product: returnCountProduct.text,
                         shipment_status_id:cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].id,
                       );
                     }


                 },borderRadius: 8,widthButton:.4)),

               ],
             ),
           ),
         ),

       );}
    );
  }
}