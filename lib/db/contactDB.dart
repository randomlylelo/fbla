import 'package:cloud_firestore/cloud_firestore.dart';

class ContactDB {
  final CollectionReference messageCollection =
      Firestore.instance.collection('message');

  Future sendMessage(String messageId, String email, String name, String id,
      String message) async {
    return await messageCollection.document(messageId).setData({
      'email': email,
      'name': name,
      'phoneNumber': id,
      'message': message,
    });
  }

  Future<String> getMessageId(String email) async {
    int i = 0;
    String messageID = email + '-$i';

    await messageCollection.getDocuments().then((QuerySnapshot snapshot) {
      // loop through the whole collection
      snapshot.documents.forEach((f) {
        // If the name exists, then add 1 to the end.
        if (f.documentID == messageID) {
          i++;
          messageID = email+'-$i';
        }
      });
    });

    // Now return the message ID
    return messageID;
  }
}
