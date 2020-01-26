import 'package:rxdart/rxdart.dart';
import 'package:venty/api/eventApi.dart';
import 'package:venty/models/eventModel.dart';

class EventsBloc {
  var _eventsCtrl = BehaviorSubject<List<EventModel>>();
  var _currIndexCtrl = BehaviorSubject<int>.seeded(0);

  Stream<List<EventModel>> get events => _eventsCtrl.stream;
  Stream<int> get currIndex => _currIndexCtrl.stream;


  onItemChanged(int index) {
    _currIndexCtrl.sink.add(index ?? _currIndexCtrl.stream.value);
  }

  getEvents() async {
    var events = await EventApi().getEvents();
    _eventsCtrl.sink.add(events);
  }

  dispose(){
    _eventsCtrl.close();
    _currIndexCtrl.close();
  }
}
