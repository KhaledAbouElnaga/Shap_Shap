import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageController extends GetxController {
  RxList<Map<String, dynamic>> categoiesList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    try {
      FirebaseFirestore.instance
          .collection('categories')
          .limit(4)
          .snapshots()
          .listen((snapshot) {
            categoiesList.clear();
            for (var doc in snapshot.docs) {
              categoiesList.add({"id": doc.id, ...doc.data()});
            }
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
