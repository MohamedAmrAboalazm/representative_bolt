import 'package:flutter/cupertino.dart';
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
        MandobCubit.get(context).getMessages(receiverId: 1000.toString());
        return BlocBuilder<MandobCubit,MandobStates>(
         builder: (context, state) {
           var cubit=MandobCubit.get(context);
           return Scaffold(
           appBar:generateAppBarForCompanyMainScreens(title: "دردشة", svgPath: "noun-talk-4679128", context: context, mainScreen: true),
            body: Column(
             children: [
               Expanded(
                 child: ListView.builder(
                     reverse: true,
                     itemBuilder: (context, index)
                     {
                       if(SharedCashHelper.getValue(key: "UserId")==cubit.messages[index].senderuId)
                       {
                         return  buildMyMessage(cubit.messages[index]);
                       }
                       else
                         return  buildMessage(cubit.messages[index]);
                     } ,
                     itemCount: cubit.messages.length),
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
                             MandobCubit.get(context)
                                 .sendMessage(
                                 text: textController.text.trim(),
                                 receiverId: 1000,
                                 datetime: DateTime.now().toString());
                                 textController.text = "";

                           }
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
           ),

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
        child: Text(message.text.toString())
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
        child: Text("message.text.toString()")
    ),
  );
}
