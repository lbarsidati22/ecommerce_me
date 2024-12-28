import 'package:ecommerce_me/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_me/layout/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: cubit.carts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            cubit.carts[index].image!,
                            height: size.height * 0.12,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cubit.carts[index].name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                '\$${cubit.carts[index].price!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                cubit.addOrRemoveCarts(
                                    prudactId:
                                        cubit.carts[index].id.toString());
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 34,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                cubit.cartsID.contains(
                                        cubit.carts[index].id.toString())
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 34,
                                color: cubit.cartsID.contains(
                                        cubit.carts[index].id.toString())
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
