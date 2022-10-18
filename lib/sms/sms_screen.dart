import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:representative_bolt/components/bloc/cubit/cubit.dart';
import 'package:representative_bolt/components/bloc/cubit/states.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';
import '../components/items.dart';

class SmsScreen extends StatefulWidget {


  @override
  State<SmsScreen> createState() => _SmsScreenState();

        String phone;

   SmsScreen(this.phone);
}

class _SmsScreenState extends State<SmsScreen> {
  var radioIdVal;

  @override
  Widget build(BuildContext context) {

    print(radioIdVal);

    return BlocConsumer<MandobCubit, MandobStates>(
      listener: (context, state){
        if(state is SuccessSendSMSState)
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDialog(text: "تم أرسال الرسالة بنجاح",image:"assets/icons/noun-success-4213622.svg",dialogHeight:.2,bigRadius:.05,smallRedius:.045,containerHight:.15),
              );
            });
          else if(state is ErorrSendSMSState) showToast(message: "حدث خطأ في ارسال الرسالة", state: ToastStates.ERORR);
          else if(state is SuccessSendOTPState)
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomDialog(text: "تم أرسال OTP بنجاح",image:"assets/icons/noun-success-4213622.svg",dialogHeight:.2,bigRadius:.05,smallRedius:.045,containerHight:.15),
                );
              });
          else if(state is ErorrSendOTPState)
          showToast(message: "حدث خطأ في ارسال OTP", state: ToastStates.ERORR);
      } ,
   builder: (context, state) {
   var cubit= MandobCubit.get(context);
    return Scaffold(
      appBar: generateAppBarForCompanyMainScreens(title: "SMS", svgPath: "noun-sms-1953496", context: context, mainScreen: true,imageSize: 80.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(height: 10,),
            defaultText(text: "أختر صيغة ال SMS",fontSize: 20),
            ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>  CardItem(buildYourContainer:
                    Row(
                        children: [
                           Radio(
                        value: index,
                        onChanged: (index)
                        {
                          setState(() {
                            radioIdVal =index ;
                          });
                        },
                        groupValue: radioIdVal,
                ),
                           Expanded(child:Text("${cubit.MessagesSMS[index]}",
                  ),
                ),
              ],
            )
                , hightCard: .2, marginTop: 10, marginEnd: 20, marginBottom: 10, marginStart: 20) ,
                  itemCount: cubit.MessagesSMS.length),
            defaultButton(context,colorButton: purple, text: "تأكيد وأرسال", widthButton: .5, borderRadius: 20,onPressed: (){
             cubit.sendMessageSMS(widget.phone,cubit.MessagesSMS[radioIdVal]);

            }),
            SizedBox(width: 2.h,),
            defaultButton(context,colorButton: purple, text: "أرسال OTP للعميل", widthButton: .8, borderRadius: 5,onPressed: (){
              MandobCubit.get(context).sendVerificationCode(widget.phone);

            })
          ],
        ),
      ),
    );
  },
);
  }
}
