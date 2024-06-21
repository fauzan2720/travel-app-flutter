part of 'transportation_bloc.dart';

sealed class TransportationEvent extends Equatable {
  const TransportationEvent();

  @override
  List<Object> get props => [];
}

class GetTransportationTrains extends TransportationEvent {
  const GetTransportationTrains();
}

class GetTransportationFlights extends TransportationEvent {
  const GetTransportationFlights();
}
