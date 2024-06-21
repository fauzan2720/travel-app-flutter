import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/transportation_model.dart';
import 'package:travel_app/services/transportation_service.dart';

part 'all_transportation_event.dart';
part 'all_transportation_state.dart';

class AllTransportationBloc
    extends Bloc<AllTransportationEvent, AllTransportationState> {
  final TransportationService service;
  AllTransportationBloc(this.service) : super(AllTransportationInitial()) {
    on<GetAllTransportations>((event, emit) async {
      emit(AllTransportationLoading());
      try {
        final result = await service.getAllTransportations();
        emit(AllTransportationSuccess(data: result));
      } catch (e) {
        emit(AllTransportationFailed(meesage: e.toString()));
      }
    });
  }
}
