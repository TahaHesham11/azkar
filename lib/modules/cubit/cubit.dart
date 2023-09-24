import 'dart:convert';

import 'package:azkar/model/home_model.dart';
import 'package:azkar/model/section_details_model.dart';
import 'package:azkar/modules/cubit/states.dart';
import 'package:azkar/modules/home_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit(): super (HomeInitialState());

  static HomeCubit get(context)=>BlocProvider.of(context);


  HomeModel? homeModel;

  List<HomeModel> model = [];

  loadSections(context)async{

    DefaultAssetBundle.of(context).loadString("assets/database/test1.json").then((value) {

      var response = json.decode(value);

      response.forEach((element){

        homeModel = HomeModel.fromJson(element);

        model.add(homeModel!);
      });

      emit(HomeLoadSectionsSuccessState());
    }).catchError((error){
      emit(HomeLoadSectionsErrorState());

      print(error);
    });

  }



  SectionModel? sectionModel;
  List<SectionModel> section = [];



  loadSectionsDetails(context )async{

    DefaultAssetBundle.of(context).loadString("assets/database/test2.json").then((value) {

      var response = json.decode(value);

      response.forEach((element){

        sectionModel = SectionModel.fromJson(element);

       print("sectionModel!.section_id: ${sectionModel?.section_id}");
    print("done.id: ${homeModel?.id}");

   if(sectionModel!.section_id == homeModel!.id){

          section.add(sectionModel!);

   }

      });
      emit(HomeLoadSectionsDetailsSuccessState());


    }).catchError((error){
      emit(HomeLoadSectionsDetailsErrorState());

      print(error.toString());
    });

  }


}