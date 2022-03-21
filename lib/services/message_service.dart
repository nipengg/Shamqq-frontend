import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamqq_frontend/models/product_model.dart';
import 'package:shamqq_frontend/models/user_model.dart';

class MessageService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage({UserModel user, bool isFromUser, String message, ProductModel product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'messages': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('Sent Message Success!'));
    } catch (e) {
      throw Exception('Sent Message Failed');
    }
  }

}