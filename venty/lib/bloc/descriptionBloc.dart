import 'package:rxdart/rxdart.dart';
import 'package:venty/api/eventApi.dart';
import 'package:venty/models/createEventModel.dart';
import 'package:venty/models/descriptionBase.dart';
import 'package:venty/models/eventModel.dart';

class DescriptionBloc {
  CreateEventModel event;

  BehaviorSubject<List<DescriptionBase>> _descriptionItems =
      BehaviorSubject<List<DescriptionBase>>.seeded([]);

  Stream<List<DescriptionBase>> get descriptionItems =>
      _descriptionItems.stream;

  List<DescriptionBase> get descriptions => _descriptionItems.stream.value;

  DescriptionBloc({event}) {
    this.event = event;
  }

  onChanged(int index, DescriptionBase content) {
    var items = descriptions;
    if (items.isNotEmpty && items.length > index) {
      items[index] = content;
    } else {
      items.add(content);
    }
    _descriptionItems.sink.add(items);
  }

  Future<bool> submit() async {
    event.description = descriptions;
    try {
      var res = await EventApi().postEvent(event);
      if (res == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
