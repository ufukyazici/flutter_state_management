import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/feature/travel/cubit/travel_cubit.dart';
import 'package:flutter_state_management/feature/travel/model/travel_model.dart';
import 'package:flutter_state_management/product/padding/page_padding.dart';
import 'package:kartal/kartal.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final data = "See All";
  final data2 = "Popular destinations near you";
  final data3 = "Hey John! \n Where do you want to go today?";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelCubit>(
      create: (context) => TravelCubit()..fetchItems(),
      child: BlocConsumer<TravelCubit, TravelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const PagePadding.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data3, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                  TextField(
                    onChanged: (value) {
                      context.read<TravelCubit>().searchByItems(value.toLowerCase());
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), prefixIcon: Icon(Icons.search)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data2,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<TravelCubit>().seeAllItems();
                        },
                        child: Text(data,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Theme.of(context).colorScheme.error)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.26),
                    child: BlocSelector<TravelCubit, TravelStates, List<TravelModel>>(
                      selector: (state) {
                        return state is TravelItemsLoaded ? state.items : context.read<TravelCubit>().allItems;
                      },
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: state.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              child: SizedBox(
                                  width: context.sized.dynamicWidth(0.36),
                                  child: Image.asset(
                                    TravelModel.mockItems[index].imagePath,
                                    fit: BoxFit.fill,
                                  )),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state is TravelItemsSeeAll ? state.images.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        final image = (state as TravelItemsSeeAll).images[index];
                        return Image.asset(image);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
