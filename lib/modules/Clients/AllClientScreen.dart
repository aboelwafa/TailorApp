import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/cubit.dart';
import 'package:ktm/layout/cubit/states.dart';

import '../../models/ClientModel.dart';
import '../../shared/components/components.dart';
import 'ClientDetails.dart';

class AllClientScreen extends StatelessWidget {
  const AllClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TailorCubit,TailorStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return ConditionalBuilder(
          condition: TailorCubit.get(context).clients.length >0,
          builder:(context) => ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) => buildChatItem(TailorCubit.get(context).clients[index],context),
              separatorBuilder: (context, index) => mydivider(),
              itemCount: TailorCubit.get(context).clients.length),
          fallback: (context) => Center(child: Text('لا يوجد عملاء ',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30.0),)),

        );
      },

    );
  }
  Widget buildChatItem(ClientModel model,context)=>InkWell(
    onTap: (){
      navigateTo(context, ClientsDetailsScreen(clientModel: model,));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${model.dateTime}'),
          Spacer(),
          Text('${model.name}',style: TextStyle(height: 3.5),),
          SizedBox(width: 12.0,),
          CircleAvatar(
            radius: 25.0,
            backgroundImage: model.ImageUrl !=null ? NetworkImage('${model.ImageUrl}'):AssetImage('assets/images/client.jpg') as ImageProvider,

          ),
        ],
      ),
    ),
  );

}
