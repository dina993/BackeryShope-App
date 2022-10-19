import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirestorageHelper {
  FirestorageHelper._();
  static FirestorageHelper firestorageHelper = FirestorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  //  uploadImage(context) async {
  //   File _image;
  //   String _url;
  //   try {
  //     //FirebaseStorage storage = (storageBucket: 'gs://test-193e1.appspot.com');
  //     Reference ref = firebaseStorage.ref().child(_image.path);
  //     UploadTask storageUploadTask = ref.putFile(_image);
  //     TaskSnapshot taskSnapshot = await storageUploadTask.whenComplete(() =>Scaffold.of(context).showSnackBar(SnackBar(
  //       content: Text('success'),
  //     )));
  //     String url = await taskSnapshot.ref.getDownloadURL();
  //     print('url $url');
  //       _url = url;
  //
  //   } catch (ex) {
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //       content: Text(ex.message),
  //     ));
  //   }
  // }

  Future<String?> uploadImage(File file, [String? directoryName]) async {
    String imageName = file.path.split('/').last;
    // 1 make a refrence for uploading image
    try {
      Reference reference = firebaseStorage.ref(directoryName == null
          ? 'users/imageName'
          : '$directoryName/$imageName');
      //2 uplad the image
      await reference.putFile(file);
      String imageUrl = await reference.getDownloadURL();
      return imageUrl;
    } on Exception catch (e) {
      print(e);
    }
  }

// Future<String> uploadImage(File _image1) async {
//   FirebaseStorage storage = FirebaseStorage.instance;
//   String url;
//   Reference ref = storage.ref().child("image1" + DateTime.now().toString());
//   UploadTask uploadTask =  ref.putFile(_image1);
//   uploadTask.whenComplete(() {
//     Future<String> url =   ref.getDownloadURL();})
//       .catchError((onError) {
//     print(onError);
//   });
//   return url;
// }

// Future<List<String>> uploadImage(List<File> images) async {
//   if (images.length < 1) return null;
//
//   List<String> _downloadUrls = [];
//
//   await Future.forEach(images, (image) async {
//     Reference ref = FirebaseStorage.instance
//         .ref()
//         .child('jobPost')
//         .child(getFileName(path: image));
//     final UploadTask uploadTask = ref.putFile(image);
//     final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
//     final url = await taskSnapshot.ref.getDownloadURL();
//     _downloadUrls.add(url);
//   });
//
//   return _downloadUrls;
// }
}
