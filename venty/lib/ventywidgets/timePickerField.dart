import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

class TimePicker extends StatefulWidget {
  TimeOfDay time;
  Function onChange;

  TimePicker({this.time, this.onChange});
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _currentTime;
  
  _setTime(TimeOfDay) {
    setState(() {
      _currentTime = TimeOfDay;
    });
    if (widget.onChange != null) {
      widget.onChange(_currentTime);
    }
  }

  _pickTime(BuildContext context) async {
    var _time = await showTimePicker(
        context: context,
        initialTime: _currentTime
        );
    
    if (_time != null) {
      _setTime(_time);
    }
  }

  @override
  void initState() {
    widget.time == null ? _setTime(TimeOfDay.now()) : _setTime(widget.time);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        child: Container(
          padding: EdgeInsets.all(0),
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: VentyColors.primaryRed.withOpacity(0.8)),
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: FlatButton(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${_currentTime.hour} : ${_currentTime.minute}",
                    style: TextStyle(color: VentyColors.primaryDark),
                  ),
                  Icon(Icons.access_time, color: VentyColors.primaryDark,)
                ],
              ),
              onPressed: () {
                _pickTime(context);
              },
              color: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: VentyColors.primaryRed,
            )));
  }
}
