part of 'all_transportation_bloc.dart';

sealed class AllTransportationEvent extends Equatable {
  const AllTransportationEvent();

  @override
  List<Object> get props => [];
}

class GetAllTransportations extends AllTransportationEvent {
  const GetAllTransportations();
}
