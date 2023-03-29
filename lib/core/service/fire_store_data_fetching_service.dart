import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDataFetchingService {
  final CollectionReference<Map<String, dynamic>> _categoriesCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  Future<QuerySnapshot<Map<String, dynamic>>> getCategory() async {
    var value = await _categoriesCollectionRef.get();
    return value;
  }

  final CollectionReference<Map<String, dynamic>> _productsCollectionRef =
      FirebaseFirestore.instance.collection('Best Selling');

  Future<QuerySnapshot<Map<String, dynamic>>> getPdoducts() async {
    var value = await _productsCollectionRef.get();
    return value;
  }
}
