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
  var radioGval;

  @override
  Widget build(BuildContext context) {

    print(radioGval);

    return BlocBuilder<MandobCubit, MandobStates>(
  builder: (context, state) {
    return Scaffold(
      appBar: generateAppBarForCompanyMainScreens(title: "SMS", svgPath: "noun-sms-1953496", context: context, mainScreen: true,imageSize: 80.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(height: 10,),
            defaultText(text: "أختر صيغة ال SMS",fontSize: 20),
            CardItem(buildYourContainer:
             Row(
              children: [
                Radio(
                  value: 'one',
                  onChanged: (s)
                  {
                    setState(() {
                      radioGval =s ;
                    });
                  },
                  groupValue: radioGval,
                ),
                Expanded(
                  child:
                  Text(
                    "مرحبا - انا مندوب الشحن لشحنة (123456) من (Shop Samar) حاولت أتصل بحضرتك يرجي اعادة الأتصال",

                  ),
                ),
              ],
            )
                , hightCard: .2, marginTop: 20, marginEnd: 20, marginBottom: 20, marginStart: 20),
            CardItem(buildYourContainer:
            Row(
              children: [
                Radio(
                  value: 'two',
                  onChanged: (s)
                  {
                    setState(() {
                      radioGval = s ;
                    });
                  },
                  groupValue: radioGval,
                ),
                Expanded(
                  child: Text(
                    "مرحبا - انا مندوب الشحن لشحنة (123456) من (Shop Samar) حاولت أتصل بحضرتك يرجي اعادة الأتصال",

                  ),
                ),
              ],
            )
                , hightCard: .2, marginTop: 0, marginEnd: 20, marginBottom: 20, marginStart: 20),
            defaultButton(context,colorButton: purple, text: "تأكيد وأرسال", widthButton: .5, borderRadius: 20,onPressed: (){
              MandobCubit.get(context).sendMessageSMS(widget.phone);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomDialog(text: "تم أرسال الرسالة بنجاح",image:"assets/icons/noun-success-4213622.svg",dialogHeight:.38,bigRadius:.09,smallRedius:.08,containerHight:.3),
                    );
                  });
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
