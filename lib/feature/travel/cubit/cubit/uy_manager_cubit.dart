import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'uy_manager_state.dart';

class UyManagerCubit extends Cubit<UyManagerState> {
  UyManagerCubit() : super(UyManagerInitial());
}
