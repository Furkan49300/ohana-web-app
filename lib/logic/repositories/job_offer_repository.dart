import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';

abstract class JobOffersRepository {
  Future<List<JobOffer>> getAllJobOffers();
  Future<List<JobOffer>> getFirstJobOffersPage();
  Future<JobOffer> getSingleJobOffer(String id);
  Future<List<JobOffer>> getNextJobOffersPage(String lastDocumentId);
  Future<List<JobOffer>> getPreviousJobOffersPage(String firstDocumentId);
  Future<List<JobOffer>> getNthJobOffersPage(int nPage);
  Future<int> getNumberJobOffersPage();
}
