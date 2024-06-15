import 'package:ohana_webapp_flutter/data/repositories/job_offer_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/repositories/job_offer_repository.dart';

class JobOfferUsecase {
  JobOffersRepository jobOffersRepository;

  JobOfferUsecase({JobOffersRepository? jobOffersRepository})
      : jobOffersRepository =
            jobOffersRepository ?? JobOfferHardCodedRepository();

  Future<List<JobOffer>> getAllBlogArticles() {
    return jobOffersRepository.getAllJobOffers();
  }
}
