import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/feature/travel/model/travel_model.dart';
import 'package:flutter_state_management/product/constant/image_enum.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelLoading());
  List<TravelModel> allItems = [];
  Future<void> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    allItems = TravelModel.mockItems;
    emit(TravelItemsLoaded(TravelModel.mockItems));
  }

  void searchByItems(String data) {
    final result = allItems.where((element) => element.title.toLowerCase().contains(data)).toList();
    emit(TravelItemsLoaded(result));
  }

  void seeAllItems() {
    emit(TravelItemsSeeAll([
      ImageEnums.camp_alt.toFeedPath,
      ImageEnums.camp_alt2.toFeedPath,
    ]));
  }
}

abstract class TravelStates {}

class TravelLoading extends TravelStates {}

class TravelItemsLoaded extends TravelStates {
  final List<TravelModel> items;
  TravelItemsLoaded(this.items);
}

class TravelItemsSeeAll extends TravelStates {
  final List<String> images;

  TravelItemsSeeAll(this.images);
}
