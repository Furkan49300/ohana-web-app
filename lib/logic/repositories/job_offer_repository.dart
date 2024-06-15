import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';

abstract class JobOffersRepository {
  Future<List<JobOffer>> getAllJobOffers();
}
