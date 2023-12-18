import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/feature/travel/model/travel_model.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelLoading());
  late List<TravelModel> _allItems;
  Future<void> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    _allItems = TravelModel.mockItems;
    emit(TravelItemsLoaded(TravelModel.mockItems));
  }

  void searchByItems(String data) {
    final result = _allItems.where((element) => element.title.toLowerCase().contains(data)).toList();
    emit(TravelItemsLoaded(result));
  }
}

abstract class TravelStates {}

class TravelLoading extends TravelStates {}

class TravelItemsLoaded extends TravelStates {
  final List<TravelModel> items;
  TravelItemsLoaded(this.items);
}
