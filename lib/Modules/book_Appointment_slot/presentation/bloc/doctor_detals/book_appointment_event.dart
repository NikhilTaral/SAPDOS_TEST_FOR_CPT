
class DoctorEvent {
  DoctorEvent(dynamic uId);
}

class FetchDoctor extends DoctorEvent {
  final dynamic uId;

  FetchDoctor(this.uId) : super('');
}
