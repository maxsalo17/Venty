import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:venty/models/createEventModel.dart';
import 'package:venty/models/locationModel.dart';

class CreateEventBloc {
  CreateEventModel event;

  BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  BehaviorSubject<LocationModel> _locationController =
      BehaviorSubject<LocationModel>();
  BehaviorSubject<DateTime> _dateController = BehaviorSubject<DateTime>();
  BehaviorSubject<TimeOfDay> _timeController = BehaviorSubject<TimeOfDay>();
  BehaviorSubject<String> _priceController = BehaviorSubject<String>();
  BehaviorSubject<String> _descriptionController = BehaviorSubject<String>();
  BehaviorSubject<File> _avatarController = BehaviorSubject<File>();
  BehaviorSubject<List<File>> _imagesController = BehaviorSubject<List<File>>();
  BehaviorSubject<bool> _switchController = BehaviorSubject<bool>();

  Stream<String> get name => _nameController.stream;
  Stream<LocationModel> get location => _locationController.stream;
  Stream<DateTime> get date => _dateController.stream;
  Stream<TimeOfDay> get time => _timeController.stream;
  Stream<String> get price => _priceController.stream;
  Stream<String> get description => _descriptionController.stream;
  Stream<File> get avatar => _avatarController.stream;
  Stream<List<File>> get images => _imagesController.stream;
  Stream<bool> get switchstream => _switchController.stream; 

  Function(String) get nameValue => _nameController.sink.add;
  Function(LocationModel) get locationValue => _locationController.sink.add;
  Function(DateTime) get dateValue => _dateController.sink.add;
  Function(TimeOfDay) get timeValue => _timeController.sink.add;
  Function(String) get priceValue => _priceController.sink.add;
  Function(String) get descriptionValue => _descriptionController.sink.add;
  Function(File) get avatarValue => _avatarController.sink.add;
  Function(List<File>) get imagesValue => _imagesController.sink.add;
  Function(bool) get switchValue => _switchController.sink.add;
  
  initializeBloc(){
  _switchController.sink.add(false);
  }

  bool _validate(){
    var isValid = true;
    if(!_nameController.stream.hasValue)
    {
      isValid = false;
    }
     if(!_locationController.stream.hasValue)
    {
      isValid = false;
    }
     if(!_dateController.stream.hasValue)
    {
      isValid = false;
    }
     if(!_timeController.stream.hasValue)
    {
      isValid = false;
    }
    //  if(!_descriptionController.stream.hasValue)
    // {
    //   isValid = false;
    // }
     if(!_avatarController.stream.hasValue)
    {
      isValid = false;
    }
    return isValid;
  }
  setEvent(){
   if(_validate()){
    event = CreateEventModel(
      name: _nameController.stream.value,
      location: _locationController.stream.value,
      date: _dateController.stream.value,
      time: _timeController.stream.value,
      price: _priceController.stream.value,
      description: _descriptionController.stream.value,
      avatar: _avatarController.stream.value,
      images: _imagesController.stream.value,
      );

      print(event.toString());
   }
  }


  dispose() {
    _nameController.close();
    _locationController.close();
    _dateController.close();
    _timeController.close();
    _priceController.close();
    _descriptionController.close();
    _avatarController.close();
    _imagesController.close();
    _switchController.close();
  }
}
