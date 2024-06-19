import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';

abstract class JobOffersRepository {
  Future<List<JobOffer>> getAllJobOffers();
  Future<List<JobOffer>> getFirstJobOfferPage();
  Future<JobOffer> getSingleJobOffer(String id);
}
