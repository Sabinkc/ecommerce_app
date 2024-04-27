import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/homepage/cubit/homepage_cubit.dart';
import 'package:ecommerce_app/features/homepage/model/products.dart';
import 'package:ecommerce_app/features/homepage/ui/widget/custom_grid.dart';
import 'package:ecommerce_app/features/details/ui/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final weight = MediaQuery.of(context).size.width;
    //RepositoryProvider.of<ProductRepository>(context).getAllProduct();
    return Scaffold(
      body: BlocBuilder<HomepageCubit, CommonState>(
        builder: (context, state) {
          if (state is CommonLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is CommonSuccessState<List<Product>>) {
            return Container(
              width: weight,
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomCarouselSlidable(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      "Popular Categories",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisExtent: 200.0,
                              mainAxisSpacing: 10),
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      itemBuilder: (context, index) {
                        return CustomGrid(
                            image: state.data[index].image,
                            title: state.data[index].name,
                            money: state.data[index].formatedPrice,
                            star: state.data[index].brand,
                            onPressed: (() {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: const DetailScreen(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            }));
                      },
                      itemCount: state.data.length,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CommonErrorState) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
