part of 'booking_bloc.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final List<History> data;
  const BookingSuccess({required this.data});
}

class BookingFailed extends BookingState {
  final String meesage;
  const BookingFailed({required this.meesage});
}
