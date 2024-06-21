part of 'booking_bloc.dart';

sealed class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class GetBookings extends BookingEvent {
  const GetBookings();
}

class CreateBooking extends BookingEvent {
  final BookingRequest request;
  const CreateBooking(this.request);
}
