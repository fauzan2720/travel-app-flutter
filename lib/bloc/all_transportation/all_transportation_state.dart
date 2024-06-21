part of 'all_transportation_bloc.dart';

sealed class AllTransportationState extends Equatable {
  const AllTransportationState();

  @override
  List<Object> get props => [];
}

class AllTransportationInitial extends AllTransportationState {}

class AllTransportationLoading extends AllTransportationState {}

class AllTransportationSuccess extends AllTransportationState {
  final List<Transportasi> data;
  const AllTransportationSuccess({required this.data});
}

class AllTransportationFailed extends AllTransportationState {
  final String meesage;
  const AllTransportationFailed({required this.meesage});
}
