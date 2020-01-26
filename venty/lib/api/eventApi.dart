import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:venty/models/createEventModel.dart';
import 'package:venty/models/eventModel.dart';

class EventApi {
  Future<dynamic> postEvent(CreateEventModel event) async {
    if (event != null) {
      try {
        var requestbody = event.toMap();
        List<String> images =
            await ImageApi().uploadImageCollection(event.images ?? []);
        String avatar = await ImageApi().uploadImage(event.avatar ?? null);

        requestbody.addAll({
          "images": [...images],
          "avatar": avatar
        });

        var response =
            await Firestore.instance.collection("events").add(requestbody);

        return response != null;
      } catch (e) {
        return "Oops! Error while creating event. Please, try again";
      }
    }
  }

  Future<List<EventModel>> getEvents() async {
    try{
      QuerySnapshot snapshots = await Firestore.instance.collection("events").getDocuments();
      var events = snapshots.documents.map((doc)=>EventModel.fromMap(doc.data)).toList();
      return events;
    }
    catch(e){
      return [];
    }
  }
}

class ImageApi {
  Future<String> uploadImage(var imageFile) async {
    if (imageFile != null) {
      try {
        var uuid = Uuid().v1();
        StorageReference ref =
            FirebaseStorage.instance.ref().child("post_$uuid.jpg");
        StorageUploadTask uploadTask = ref.putFile(imageFile);

        String downloadUrl =
            await (await uploadTask.onComplete).ref.getDownloadURL();
        return downloadUrl;
      } catch (e) {
        print("Upload image $imageFile error: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<String>> uploadImageCollection(List<File> images) async {
    List<String> urls = [];
    try {
      for (File image in images) {
        var res = await uploadImage(image);
        if (res != null && res.isNotEmpty) {
          urls.add(res);
        }
      }
      return urls;
    } catch (e) {
      print("Uploading photos error: $e");
      return urls;
    }
  }
}
