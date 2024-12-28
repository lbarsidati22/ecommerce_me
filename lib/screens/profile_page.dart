import 'package:ecommerce_me/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_me/layout/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  cubit.userModel!.image!,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User : ${cubit.userModel!.name}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Email : ${cubit.userModel!.email}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Phone : ${cubit.userModel!.phone}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
