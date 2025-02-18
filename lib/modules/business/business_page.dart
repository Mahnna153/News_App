import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;

          if (list.length > 0) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    newsItemBuilder(list[index], context),
                separatorBuilder: (context, index) => divider(),
                itemCount: list.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
