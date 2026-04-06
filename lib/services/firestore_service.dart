import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item.dart';

class FirestoreService {
  final CollectionReference _itemsRef =
      FirebaseFirestore.instance.collection('items');

  /// Stream of all items — UI rebuilds automatically on changes
  Stream<List<Item>> streamItems() {
    return _itemsRef.snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => Item.fromMap(doc.id, doc.data() as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Add a new item to Firestore
  Future<void> addItem(Item item) async {
    await _itemsRef.add(item.toMap());
  }

  /// Update an existing item by ID
  Future<void> updateItem(Item item) async {
    await _itemsRef.doc(item.id).update(item.toMap());
  }

  /// Delete an item by ID
  Future<void> deleteItem(String id) async {
    await _itemsRef.doc(id).delete();
  }
}