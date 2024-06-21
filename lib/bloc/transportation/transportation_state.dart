part of 'transportation_bloc.dart';

sealed class TransportationState extends Equatable {
  const TransportationState();

  @override
  List<Object> get props => [];
}

class TransportationInitial extends TransportationState {}

class TransportationLoading extends TransportationState {}

class TransportationSuccess extends TransportationState {
  final List<Transportasi> data;
  const TransportationSuccess({required this.data});
}

class TransportationFailed extends TransportationState {
  final String meesage;
  const TransportationFailed({required this.meesage});
}
