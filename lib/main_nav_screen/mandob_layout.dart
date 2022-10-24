import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/bloc/cubit/cubit.dart';
import '../components/bloc/cubit/states.dart';

class MandobLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MandobCubit, MandobStates>(
        builder: (context, state) {
          var cubit = MandobCubit.get(context);
          return Scaffold(
              body: cubit.bottomScreens[cubit.CurrentIndex],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  cubit.changeIndex(value,context);


                },
                currentIndex: cubit.CurrentIndex,
                items: cubit.BottomItem,
                selectedFontSize: 10,
              ));
        });
  }
}
