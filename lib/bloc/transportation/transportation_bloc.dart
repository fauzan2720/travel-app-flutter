import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/transportation_model.dart';
import 'package:travel_app/services/transportation_service.dart';

part 'transportation_event.dart';
part 'transportation_state.dart';

class TransportationBloc
    extends Bloc<TransportationEvent, TransportationState> {
  final TransportationService service;
  TransportationBloc(this.service) : super(TransportationInitial()) {
    on<GetTransportationTrains>((event, emit) async {
      emit(TransportationLoading());
      try {
        final result = await service.getTransportationTrains();
        emit(TransportationSuccess(data: result));
      } catch (e) {
        emit(TransportationFailed(meesage: e.toString()));
      }
    });

    on<GetTransportationFlights>((event, emit) async {
      emit(TransportationLoading());
      try {
        final result = await service.getTransportationFlights();
        emit(TransportationSuccess(data: result));
      } catch (e) {
        emit(TransportationFailed(meesage: e.toString()));
      }
    });
  }
}
