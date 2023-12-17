import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/feature/travel/model/travel_model.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelLoading());
  Future<void> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(TravelItemsLoaded(TravelModel.mockItems));
  }
}

abstract class TravelStates {}

class TravelLoading extends TravelStates {}

class TravelItemsLoaded extends TravelStates {
  final List<TravelModel> items;
  TravelItemsLoaded(this.items);
}