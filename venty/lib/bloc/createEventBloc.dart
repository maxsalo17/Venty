import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:venty/api/eventApi.dart';
import 'package:venty/models/categoryModel.dart';
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
  BehaviorSubject<bool> _switchVideoController = BehaviorSubject<bool>();
  BehaviorSubject<String> _linkVideoController = BehaviorSubject<String>();
  BehaviorSubject<Category> _categoryController = BehaviorSubject<Category>();

  var _isLoadingController = BehaviorSubject<bool>();
  var _errorController = BehaviorSubject<String>();

  Stream<String> get name => _nameController.stream;
  Stream<LocationModel> get location => _locationController.stream;
  Stream<DateTime> get date => _dateController.stream;
  Stream<TimeOfDay> get time => _timeController.stream;
  Stream<String> get price => _priceController.stream;
  Stream<String> get description => _descriptionController.stream;
  Stream<File> get avatar => _avatarController.stream;
  Stream<List<File>> get images => _imagesController.stream;
  Stream<bool> get switchstream => _switchController.stream;
  Stream<bool> get switchvideostream => _switchVideoController.stream;
  Stream<String> get linkvideostream => _linkVideoController.stream;
  Stream<Category> get category => _categoryController.stream;

  Stream<bool> get isLoading => _isLoadingController.stream;
  Stream<String> get error => _errorController.stream;

  Function(String) get nameValue => _nameController.sink.add;
  Function(LocationModel) get locationValue => _locationController.sink.add;
  Function(DateTime) get dateValue => _dateController.sink.add;
  Function(TimeOfDay) get timeValue => _timeController.sink.add;
  Function(String) get priceValue => _priceController.sink.add;
  Function(String) get descriptionValue => _descriptionController.sink.add;
  Function(File) get avatarValue => (file) {
        _avatarController.sink.add(file ?? _avatarController.stream.value);
      };
  Function(List<File>) get imagesValue => _imagesController.sink.add;
  Function(bool) get switchValue => _switchController.sink.add;
  Function(bool) get switchvideoValue => _switchVideoController.sink.add;
  Function linkvideoValue(String) {
    bool linkValid =
        RegExp(r'^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+')
            .hasMatch(String);
    !linkValid
        ? _linkVideoController.sink.addError('Ivalid videolink')
        : _linkVideoController.sink.add(String);
  }

  Function linkVideoError(String) {
    _linkVideoController.sink.addError('Ivalid videolink');
  }

  Function categoryChanged(Category) {
    _categoryController.sink.add(Category ?? _categoryController.stream.value);
  }

  initializeBloc() {
    _switchController.sink.add(false);
  }

  bool _validate() {
    var isValid = true;
    if (!_nameController.stream.hasValue) {
      _nameController.sink.addError("Type event name");
      isValid = false;
    }
    if (!_locationController.stream.hasValue) {
      _locationController.sink.addError("Select event location");
      isValid = false;
    }
    if (!_dateController.stream.hasValue) {
      _dateController.sink.addError('Choose date');
      isValid = false;
    }
    if (!_timeController.stream.hasValue) {
      isValid = false;
    }
    //  if(!_descriptionController.stream.hasValue)
    // {
    //   isValid = false;
    // }
    if (!_avatarController.stream.hasValue) {
      isValid = false;
    }
    if (_linkVideoController.stream.hasValue) {
      bool linkValid = RegExp(
              r'/^((http\:\/\/){0,}(www\.){0,}(youtube\.com){1}|(youtu\.be){1}(\/watch\?v\=[^\s]){1})$/')
          .hasMatch(_linkVideoController.stream.value);
      isValid = false;
      if (linkValid) _linkVideoController.sink.addError('Ivalid videolink');
    }
    return isValid;
  }

  Future<bool> setEvent() async {
    if (_validate()) {
      event = CreateEventModel(
          name: _nameController.stream.value,
          location: _locationController.stream.value,
          date: _dateController.stream.value,
          time: _timeController.stream.value,
          price: _priceController.stream.value,
          description: _descriptionController.stream.value,
          avatar: _avatarController.stream.value,
          images: _imagesController.stream.value,
          category: _categoryController.stream.value);

      _isLoadingController.sink.add(true);
      var res = await EventApi().postEvent(event);
      _isLoadingController.sink.add(false);
      if(res is String){
        _errorController.sink.add("$res");
        return false;
      }
      else{
        return res;
      }
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
    _switchVideoController.close();
    _linkVideoController.close();
    _categoryController.close();
    _isLoadingController.close();
    _errorController.close();
  }
}
