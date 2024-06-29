
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/payment/domin/usecases/payment_usecases.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_event.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final BookAppointmentUseCase bookAppointmentUseCase;

  AppointmentBloc(this.bookAppointmentUseCase) : super(AppointmentInitial());

  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    if (event is BookAppointmentEvent) {
      yield AppointmentLoading();
      try {
        await bookAppointmentUseCase.execute(event.request);
        yield AppointmentSuccess();
      } catch (e) {
        yield AppointmentFailure(e.toString());
      }
    }
  }
}
