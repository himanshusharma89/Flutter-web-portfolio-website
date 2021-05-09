import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/experience/expereince.dart';

class ExperienceProvider with ChangeNotifier {
  List<ExperienceModel> experience = <ExperienceModel>[];

  Future<List<ExperienceModel>> getExperience() async {
    final _ = await FirebaseFirestore.instance
        .collection('experience')
        .orderBy('startAt', descending: true)
        .get()
        .then((QuerySnapshot e) => e.docs);

    _.forEach((QueryDocumentSnapshot event) {
      experience.add(
          ExperienceModel.fromSnapshot(event.data()! as Map<String, dynamic>));
    });
    notifyListeners();
    return experience;
  }
}
