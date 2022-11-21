import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_bolt/components/bloc/cubit/cubit.dart';
import 'package:representative_bolt/components/bloc/cubit/states.dart';
import 'package:representative_bolt/components/items.dart';
import 'package:representative_bolt/components/sharedpref/shared_preference.dart';
import 'package:representative_bolt/constants/themes.dart';
import 'package:representative_bolt/models/message_model.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';

class ChatMessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController=TextEditingController();

    return Builder(
      builder: (context) {
        MandobCubit.get(context).getMessagesRealTimeDataBase();
        return BlocBuilder<MandobCubit,MandobStates>(
         builder: (context, state) {
           var cubit=MandobCubit.get(context);
           return Scaffold(
           appBar:generateAppBarForCompanyMainScreens(title: "دردشة", svgPath: "noun-talk-4679128", context: context, mainScreen: true),
            body:Center(child: Text("SOOOOOOOOOON",style: TextStyle(fontSize: 18.sp),))

             /*Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      // reverse: false,
                      controller: cubit.controller,
                      itemBuilder: (context, index)
                      {
                        if(index==cubit.messages.length)
                          {
                           return Container(height: 8.h,);
                          }
                          if(SharedCashHelper.getValue(key: "UserId").toString()==cubit.messages[index].senderuId)
                          {
                            return  buildMyMessage(cubit.messages[index]);
                          }
                          else
                            return  buildMessage(cubit.messages[index]);
                      } ,
                      itemCount: cubit.messages.length+1),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                    decoration:BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width:1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: textController,
                              onFieldSubmitted: (s){

                              },
                              decoration: InputDecoration(
                                  border:InputBorder.none,
                                  hintText:"type your message here ...."

                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          color: purple,
                          child: MaterialButton(onPressed: (){
                            if(textController.text.trim().isNotEmpty) {
                              *//*    MandobCubit.get(context)
                                   .sendMessage(
                                   text: textController.text.trim(),
                                   receiverId: 1000,
                                   datetime: DateTime.now().toString());*//*

                              MandobCubit.get(context).sendMessageRealTimeDataBase(text: textController.text.trim(),
                                  receiverId: 1000.toString(),
                                  datetime: DateTime.now().toString());
                              textController.text = "";
                              cubit.controller.animateTo(cubit.controller.position.maxScrollExtent, duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);

                            }
                            //MandobCubit.get(context).getMessagesRealTimeDataBase(receiverId: 1000.toString());
                          },
                            minWidth: 1,
                            child: Icon(Icons.send,color: Colors.white,size: 16,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),*/
            );});
      });

  }
  Widget buildMyMessage(MessageModel message)=>Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: BoxDecoration(
          color: purpleColor.withOpacity(.2),
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd:Radius.circular(15),
              topEnd: Radius.circular(15),
              topStart: Radius.circular(15)
          ),
        ),
        margin:EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 1.h,
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.text.toString()),
            Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: .2.h),
                  child: Text(intl.DateFormat.jm().format(DateTime.parse(message.dateTime!)).toString(),),
                )),
          ],
        )
    ),
  );
  Widget buildMessage(MessageModel message)=> Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
              bottomStart:Radius.circular(15),
              topEnd: Radius.circular(15),
              topStart: Radius.circular(15)
          ),
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10
        ),
        margin:EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message.text.toString()),
            Directionality(
                textDirection: TextDirection.ltr,
                child: Text(intl.DateFormat.jm().format(DateTime.parse(message.dateTime!)).toString(),style: TextStyle(color: Colors.red,),)),

          ],
        )
    ),
  );


}
