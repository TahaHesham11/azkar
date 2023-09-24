import 'package:azkar/model/section_details_model.dart';
import 'package:azkar/modules/cubit/cubit.dart';
import 'package:azkar/modules/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetails extends StatelessWidget {
  final int?  id ;
 final String? title;

HomeDetails({
  this.title,
  this.id
});



  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,index){},
      builder: (context,index){

        return Scaffold(
          appBar: AppBar(
            title: Text(
             // HomeCubit.get(context).homeModel!.name!
              'أذكار المسلم'
            ),
            actions: [
              IconButton(onPressed: (){

              }, icon: Icon(Icons.add))
            ],
          ),

          body: Center(
       child: ListView.separated(
           itemBuilder: (context,index)=>buildSectionItem(HomeCubit.get(context).section[index]),
           separatorBuilder: (context,index)=>Container(
             height: 1,
             width: double.infinity,
             color: Colors.deepOrange,
         ),
           itemCount: HomeCubit.get(context).section.length),
     ),
     );
   },

   );

 }


 Widget buildSectionItem(SectionModel model)=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    children: [
      Text(
        model.reference!,
        textDirection: TextDirection.rtl,
      ),

      Text(
        model.content!,
        textDirection: TextDirection.rtl,

      ),
    ],
  ),
);
}
