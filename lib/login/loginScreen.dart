import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_bolt/components/items.dart';
import 'package:representative_bolt/login/bloc/cubit_class.dart';
import 'package:sizer/sizer.dart';
import '../constants/themes.dart';
import '../functions/functions_needed.dart';
import '../main_nav_screen/mandob_layout.dart';
import 'bloc/states.dart';
import '';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (context)=>LoginCubitClass(),
      child: BlocConsumer<LoginCubitClass, LoginStates>(
        listener: (context, state) {

          if(state is LoginSuccessState)
          {
            navigateAndFinish(context, layout: MandobLayout());
          }
          else if(state is ShowErrorInSnackBar){
            showToast(message: "${LoginCubitClass.get(context).errorMessage}",state:  ToastStates.ERORR);
          }
        },
        builder: (context, state) {

          var cubit = LoginCubitClass.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.h),
                child: Form(
                   key: cubit.formLogin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/bolt logo.png',
                          width: 50.w,
                          height: 40.h,
                        ),
                      ),
                      CustomTextFormField(controller:cubit.phoneController,marginTop: .3.h,marginbottom: .3.h,hintText: "رقم الهاتف",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "برجاء ادخال رقم الهاتف";
                            }
                            if (value.contains(" ")) {
                              return "يجب ان لا يوجد مسافات";
                            }
                            if (value.contains(",")) {
                              return "يجب ان لا يوجد حروف";
                            }
                            return null;
                          }, maxLines: 1,keyboardtype: TextInputType.phone),
                      SizedBox(height: 1.h,),
                      CustomTextFormField(
                          marginTop: .3.h,marginbottom: .3.h,
                          obscuretext: cubit.isPassword ? true : false,
                          controller: cubit.passwordController,
                          keyboardtype: TextInputType.visiblePassword,
                          hintText: "كلمة السر",
                          suffixicon:InkWell(child:Icon(!cubit.isPassword ?  Icons.visibility_off : Icons.remove_red_eye),onTap: (){
                            cubit.makeItReadAble();
                          },),
                          validator: (value) {
                            if (value!.isEmpty) {
                               return "برجاء ادخال الباسورد  ";
                            }
                            if (value.length<8) {
                              return "برجاء ادخال الباسورد لا يقل عن 8 أحرف ";
                            }
                            return null;
                          }, maxLines: 1),
                      Row(
                        children: [
                          Text(
                            "تذكرني",
                            style: TextStyle(
                                fontSize: 17,
                                color: textGreyTwoColor,
                                fontWeight: FontWeight.bold),
                          ),
                          cubit.remember == false
                              ? IconButton(
                              onPressed: () {
                                cubit.makeRemember();
                              },
                              icon: Icon(
                                  Icons.check_box_outline_blank_rounded,
                                  color: yellowColor))
                              : IconButton(
                            onPressed: () {
                              cubit.makeNotRemember();
                            },
                            icon: const Icon(Icons.check_box),
                            color: yellowColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      ConditionalBuilder(
                        condition: state is ! LoginLoadingState,
                        fallback: (context)=> Center(
                          child: CircularProgressIndicator(color:purpleColor),
                        ),
                        builder: (context)=>ButtonCustomDesign(
                          text: const Text(
                            "تسجيل الدخول",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          inkwellFunc: () {
                            if (cubit.formLogin.currentState!.validate()) {
                                 cubit.login();
                            }
                          },
                          containerColor: yellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
