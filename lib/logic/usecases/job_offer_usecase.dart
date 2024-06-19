import 'package:ohana_webapp_flutter/data/repositories/mock/job_offer_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/repositories/job_offer_repository.dart';

class JobOfferUsecase {
  JobOffersRepository jobOffersRepository;

  JobOfferUsecase({JobOffersRepository? jobOffersRepository})
      : jobOffersRepository =
            jobOffersRepository ?? JobOfferHardCodedRepository();

  Future<List<JobOffer>> getAllJobOffers() {
    return jobOffersRepository.getAllJobOffers();
  }

  Future<JobOffer> getSingleJobOffer(String id) {
    return jobOffersRepository.getSingleJobOffer(id);
  }
}
