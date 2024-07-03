import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/repositories/job_offer_repository.dart';

class JobOfferFirebaseRepository implements JobOffersRepository {
  final pageSize = 5;
  final String jobOfferCollection = 'emploi';
  @override
  Future<List<JobOffer>> getAllJobOffers() {
    // TODO: implement getAllJobOffers
    throw UnimplementedError();
  }

  @override
  Future<JobOffer> getSingleJobOffer(String id) async {
    // Recuperer le dernier document via son Id
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .doc(id)
        .get();
    return _jobOfferMapping(querySnapshot);
  }

//FIRST PAGE

  @override
  Future<List<JobOffer>> getFirstJobOffersPage() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .orderBy('publish_date', descending: false)
        .limit(pageSize)
        .get();
    return query.docs.map(_jobOfferMapping).toList();
  }

//PREVIOUS

  @override
  Future<List<JobOffer>> getPreviousJobOffersPage(
      String firstDocumentId) async {
    // 1 - Recuperer le dernier document via son Id
    DocumentSnapshot firstDocSnapshot = await FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .doc(firstDocumentId)
        .get();

    // Step 2: Utiliser startBefore avec le document recuperé
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .orderBy('publish_date', descending: true)
        .endBeforeDocument(firstDocSnapshot)
        // .limit(pageSize)
        .get();

    List<QueryDocumentSnapshot> querySnapshotreverse =
        querySnapshot.docs.reversed.take(pageSize).toList();

    // Parcourt les documents dans la collection
    return querySnapshotreverse.map(_jobOfferMapping).toList();
  }

//NEXT

  @override
  Future<List<JobOffer>> getNextJobOffersPage(String lastDocumentId) async {
    // 1 - Recuperer le dernier document via son Id
    DocumentSnapshot lastDocSnapshot = await FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .doc(lastDocumentId)
        .get();

    // Step 2: Utiliser startAfter avec le document recuperé
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .orderBy('publish_date', descending: true)
        .startAfterDocument(lastDocSnapshot)
        .limit(pageSize)
        .get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_jobOfferMapping).toList();
  }

//NTH

  @override
  Future<List<JobOffer>> getNthJobOffersPage(int nPage) async {
    Query query = FirebaseFirestore.instance
        .collection(jobOfferCollection)
        .orderBy('publish_date', descending: true);
    DocumentSnapshot lastDocument;
    for (int i = 1; i < nPage; i++) {
      QuerySnapshot querySnapshot = await query.limit(pageSize).get();
      if (querySnapshot.docs.isEmpty) {
        return []; // Si aucune donnée n'est trouvée, retourner une liste vide
      }
      lastDocument = querySnapshot.docs.last;
      query = query.startAfterDocument(lastDocument);
    }
    QuerySnapshot querySnapshot = await query.limit(pageSize).get();
    return querySnapshot.docs.map(_jobOfferMapping).toList();
  }

  @override
  Future<int> getNumberJobOffersPage() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(jobOfferCollection).get();
    int numberOfUsers = querySnapshot.size;
    double pagesNumberFraction = numberOfUsers / pageSize;
    int jobOfferPageNumber = pagesNumberFraction.ceil();
    return jobOfferPageNumber;
  }

//MAPPER

  JobOffer _jobOfferMapping(doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return JobOffer(
        id: doc.id,
        title: data['title'],
        imagePath: data['url_image'],
        place: data['place'],
        duration: data['duration'],
        contract: data['contract'],
        pulishDate: data['publish_date'].toDate(),
        salary: data['salary'],
        alert: data['alert']);
  }
  //-------
}
