// ignore_for_file: file_names

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  firebase_storage.Reference ref() {
    return storage.ref();
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage.ref().child('agents/$imageName.jpg').getDownloadURL();
    return downloadURL;
  }

  Future<List> listAll() async {
    List result = [];
    firebase_storage.ListResult listResult = await storage.ref().listAll();
    for (var ref in listResult.items) {
      result.add(ref.name);
    }
    return result;
  }
}
