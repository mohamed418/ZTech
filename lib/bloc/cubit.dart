import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_tech/bloc/states.dart';

class ZTechCubit extends Cubit<ZTechStates> {
  ZTechCubit() : super(ZTechInitialState());

  static ZTechCubit get(context) => BlocProvider.of(context);

  IconData icon = Icons.visibility;
  bool isVisible = true;
  void visible(){
    isVisible = !isVisible;
    icon = isVisible? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginIconStateState());
  }

  IconData icon1 = Icons.visibility;
  bool isVisible1 = true;
  dynamic visible1(){
    isVisible1 = !isVisible1;
    icon1 = isVisible1? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginIconStateState1());
  }

  IconData icon2 = Icons.visibility;
  bool isVisible2 = true;
  void visible2(){
    isVisible2 = !isVisible2;
    icon2 = isVisible2? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginIconStateState2());
  }

}
