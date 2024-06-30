import 'package:ohana_webapp_flutter/data/repositories/firebase/job_offer_firebase_repository.dart';
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

  Future<List<JobOffer>> getFirstJobOffersPage() {
    return jobOffersRepository.getFirstJobOffersPage();
  }

  Future<List<JobOffer>> getNextJobOffersPage(String lastDocumentId) {
    return jobOffersRepository.getNextJobOffersPage(lastDocumentId);
  }

  Future<List<JobOffer>> getNthJobOffersPage(int nPage) {
    return jobOffersRepository.getNthJobOffersPage(nPage);
  }

  Future<List<JobOffer>> getPreviousJobOffersPage(String firstDocumentId) {
    return jobOffersRepository.getPreviousJobOffersPage(firstDocumentId);
  }
}
