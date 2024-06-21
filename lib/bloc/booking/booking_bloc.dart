import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/booking_model.dart';
import 'package:travel_app/models/booking_request.dart';
import 'package:travel_app/services/booking_service.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingService service;
  BookingBloc(this.service) : super(BookingInitial()) {
    on<GetBookings>((event, emit) async {
      emit(BookingLoading());
      try {
        final result = await service.getHistories();
        emit(BookingSuccess(data: result));
      } catch (e) {
        emit(BookingFailed(meesage: e.toString()));
      }
    });

    on<CreateBooking>((event, emit) async {
      emit(BookingLoading());
      try {
        await service.create(event.request);
        add(const GetBookings());
      } catch (e) {
        emit(BookingFailed(meesage: e.toString()));
      }
    });
  }
}
