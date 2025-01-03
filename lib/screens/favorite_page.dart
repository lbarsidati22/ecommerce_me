import 'package:ecommerce_me/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_me/layout/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return Center(
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          //cubit.favorits.isEmpty?CircularProgressIndicator():
          return cubit.favorits.isEmpty
              ? Text('Don\'t have a favorte prudact')
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: cubit.favorits.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.black,
                          elevation: 4,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  cubit.favorits[index].image!,
                                  fit: BoxFit.cover,
                                  height: size.height * 0.11,
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        cubit.favorits[index].name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        '\$${cubit.favorits[index].price!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Colors.grey,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    cubit.addOrRemoveFavorite(
                                        prudactId: cubit.products[index].id
                                            .toString());
                                  },
                                  icon: Icon(
                                    cubit.favoritID.contains(
                                            cubit.products[index].id.toString())
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 28,
                                    color: cubit.favoritID.contains(
                                            cubit.products[index].id.toString())
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
        },
      ),
    );
  }
}
