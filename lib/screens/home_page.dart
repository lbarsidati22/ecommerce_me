import 'package:ecommerce_me/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_me/layout/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        final size = MediaQuery.of(context).size;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                cubit.banners.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: size.height * 0.20,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.banners.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  '${cubit.banners[index].url}',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.10,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 33,
                        backgroundImage:
                            NetworkImage(cubit.categories[index].image!),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                    itemCount: cubit.categories.length,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Prudact',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.products.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    height: size.height * 0.16,
                                    cubit.products[index].image!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  '${cubit.products[index].name}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        '\$${cubit.products[index].price}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.green,
                                        shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Text(
                                              'add',
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              Icons.shopping_cart_rounded,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8)),
                          child: InkWell(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Icon(
                                Icons.shopping_cart_rounded,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
 // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 14),
              //   child: TextFormField(
              //     keyboardType: TextInputType.emailAddress,

              //     // controller: controller,
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       prefixIcon: Icon(Icons.search),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(33),
              //         borderSide: BorderSide(
              //           color: Colors.grey,
              //         ),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(33),
              //         borderSide: BorderSide(
              //           color: Colors.grey,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              