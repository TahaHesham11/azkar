import 'package:azkar/componets.dart';
import 'package:azkar/model/home_model.dart';
import 'package:azkar/modules/cubit/cubit.dart';
import 'package:azkar/modules/cubit/states.dart';
import 'package:azkar/modules/home_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'اذكار المسلم',
                style: TextStyle(
                  fontFamily: 'SansArabic',
                  fontSize: 22.0,
                ),

              ),
              elevation: 0.0,
              centerTitle: true,

            ),

            body: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildHomeItem(HomeCubit.get(context).model[index],context),
                separatorBuilder: (context,index)=> SizedBox(height: 5.0,),
                itemCount: HomeCubit.get(context).model.length)
        );
      },
    );

  }
  // HomeDetails? id = HomeDetails(id: HomeCubit().homeModel!.id,);


Widget buildHomeItem(HomeModel homeModel ,context) =>  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: [

        InkWell(
          onTap: ()
          {
            navigateTo(context, HomeDetails(id: homeModel.id,title: homeModel.name,));

          },
          child: Container(
            height: 100.0,
            width: double.infinity,


            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepOrange,
                  Colors.orange
                ]
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                homeModel.name!,
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'SansArabic',
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),


      ],
    ),
  );
}
