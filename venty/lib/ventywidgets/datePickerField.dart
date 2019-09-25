import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

class DatePicker extends StatefulWidget {
  DateTime date;
  Function(DateTime) onChange;

  DatePicker({this.date, this.onChange});
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _currentDate;
  List<String> monthNames = [
    "Янв",
    "Фев",
    "Мар",
    "Апр",
    "Май",
    "Июл",
    "Июн",
    "Авг",
    "Сен",
    "Окт",
    "Ноя",
    "Дек"
  ];

  _setDate(DateTime) {
    setState(() {
      _currentDate = DateTime;
    });
    if (widget.onChange != null) {
      widget.onChange(_currentDate);
    }
  }

  _pickDate(BuildContext context) async {
    var _date = await showDatePicker(
        context: context,
        initialDate: _currentDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_date != null) {
      _setDate(_date);
    }
  }

  String _getMonthName(int number, List<String> names) {
    if (names.isEmpty || names.length < 12) {
      names = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
      ];
    }
    if (number > 12 || number < 1) {
      number = 1;
    }

    return names[number - 1];
  }

  @override
  void initState() {
    //widget.date == null ? _setDate(DateTime.now()) : _setDate(widget.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.calendar_today,
        color: VentyColors.primaryRed,
      ),
      title: _currentDate == null
          ? Text("Select event date", style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.w600,
                                              color: VentyColors.secondaryDark,
                                          ),)
          : Text(
              "${_currentDate.day} ${_getMonthName(_currentDate.month, monthNames)} ${_currentDate.year}", style: 
              TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.w600,
                                              color: VentyColors.secondaryDark,
                                          ),),
      onTap: () {
        _pickDate(context);
      },
    );

    // return ClipRRect(
    //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
    //     child: Container(
    //       padding: EdgeInsets.all(0),
    //         width: double.infinity,
    //         height: 50.0,
    //         decoration: BoxDecoration(
    //             border: Border.all(
    //                 width: 2.0, color: VentyColors.primaryRed.withOpacity(0.8)),
    //             borderRadius: BorderRadius.all(Radius.circular(50.0))),
    //         child: FlatButton(

    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Text(
    //                 "${_currentDate.day} ${_getMonthName(_currentDate.month, monthNames)} ${_currentDate.year}",
    //                 style: TextStyle(color: VentyColors.primaryDark),
    //               ),
    //               Icon(Icons.date_range, color: VentyColors.primaryDark,)
    //             ],
    //           ),
    //           onPressed: () {
    //             _pickDate(context);
    //           },
    //           color: Colors.transparent,
    //           highlightColor: Colors.transparent,
    //           hoverColor: Colors.transparent,
    //           splashColor: VentyColors.primaryRed,
    //         )));
  }
}
