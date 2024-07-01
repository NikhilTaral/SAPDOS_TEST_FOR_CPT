import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/payment/domin/usecases/payment_usecases.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_event.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final BookAppointmentUseCase bookAppointmentUseCase;

  AppointmentBloc(this.bookAppointmentUseCase) : super(AppointmentInitial()) {
    on<BookAppointmentEvent>((event, emit) async {
      emit(AppointmentLoading());
      try {
        await bookAppointmentUseCase.execute(event.request);
        emit(AppointmentSuccess());
      } catch (e) {
        emit(AppointmentFailure(e.toString()));
      }
    });
  }
}
