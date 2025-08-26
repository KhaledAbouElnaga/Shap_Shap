import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //for all categories
  RxList<Map<String, dynamic>> allCategoiesList = <Map<String, dynamic>>[].obs;
  //.take(n).tolist >>> n = how many category i wanna show
  RxList<Map<String, dynamic>> someCategoiesList = <Map<String, dynamic>>[].obs;
  //for all items
  RxList<Map<String, dynamic>> allItemsList = <Map<String, dynamic>>[].obs;
  //for items based on categoy
  RxList<Map<String, dynamic>> itemsByCategorList =
      <Map<String, dynamic>>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategoies();
    getAllItems();
  }

  void getAllCategoies() {
    try {
      isLoading.value = true;
      firestore.collection('categories').snapshots().listen((snapshot) async {
        await Future.delayed(Duration(seconds: 1));
        allCategoiesList.clear();
        for (var doc in snapshot.docs) {
          allCategoiesList.add({"id": doc.id, ...doc.data()});
        }
        // to take the first 4 doc from the whole list.
        someCategoiesList.value = allCategoiesList.take(4).toList();
        isLoading.value = false;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  void getAllItems() async {
    try {
      isLoading.value = true;
      //Because "items" repeated in every doc in the main categories,
      // we could make a loop to bring them all.
      firestore
          .collectionGroup("items")
          .snapshots()
          .listen(
            (itemsSnapshot) {
              allItemsList.assignAll(
                itemsSnapshot.docs.map((itemDoc) {
                  final categoryId = itemDoc.reference.parent.parent?.id ?? '';
                  return {
                    "id": itemDoc.id,
                    "categoryId": categoryId,
                    ...itemDoc.data(),
                  };
                }).toList(),
              );
              isLoading.value = false;
            },
            onError: (error) {
              // print("Error fetching items in realtime: $error");
              isLoading.value = false;
            },
          );
    } catch (e) {
      // print("Error setting up items listener: $e");
      isLoading.value = false;
    }
  }

  void getItemsByCategory(String categoryId) async {
    try {
      isLoading.value = true;
      firestore
          .collection("categories")
          .doc(categoryId)
          .collection("items")
          .snapshots()
          .listen(
            (itemsSnapshot) {
              itemsByCategorList.assignAll(
                itemsSnapshot.docs.map((itemDoc) {
                  return {"id": itemDoc.id, ...itemDoc.data()};
                }).toList(),
              );
              isLoading.value = false;
            },
            onError: (error) {
              // print("Error fetching items for category $categoryId: $error");
              isLoading.value = false;
            },
          );
    } catch (e) {
      // print("Error setting up category items listener: $e");
      isLoading.value = false;
    }
  }
}
