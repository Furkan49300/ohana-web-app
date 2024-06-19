import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/repositories/job_offer_repository.dart';

class JobOfferFirebaseRepository implements JobOffersRepository {
  final pageSize = 6;
  @override
  Future<List<JobOffer>> getAllJobOffers() {
    // TODO: implement getAllJobOffers
    throw UnimplementedError();
  }

  @override
  Future<JobOffer> getSingleJobOffer(String id) {
    // TODO: implement getSingleJobOffer
    throw UnimplementedError();
  }

  @override
  Future<List<JobOffer>> getFirstJobOfferPage() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('job_offers')
        .orderBy('publish_date', descending: false)
        .limit(pageSize)
        .get();
    return query.docs.map(_jobOfferMapping).toList();
  }

//MAPPER

  JobOffer _jobOfferMapping(doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return JobOffer(
        id: doc.id,
        title: data['title'],
        description: data['description'],
        advantages: data['advantages'],
        profil: data['profil'],
        imagePath: data['url_image'],
        place: data['place'],
        duration: data['duration'],
        contract: data['contact'],
        salary: data['salary'],
        pulishDate: data['publish_date'],
        alert: data['alert']);
  }
}
