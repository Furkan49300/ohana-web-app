import 'dart:math';

import 'package:ohana_webapp_flutter/data/repositories/mock/custom_convertor.dart';
import 'package:ohana_webapp_flutter/data/exception/job_offer_network_exceptions.dart';
import 'package:ohana_webapp_flutter/data/exception/job_offer_server_exceptions.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/repositories/job_offer_repository.dart';

class JobOfferHardCodedRepository implements JobOffersRepository {
  final Random _random = Random();
  @override
  Future<List<JobOffer>> getAllJobOffers() async {
    List listOfOffers = [
      {
        'id': '1',
        'title': 'Développeur React',
        'image': 'assets/offers_images/React-Developer-Tools.png',
        'description': '',
        'content': '',
        'profil': [''],
        'duration': '2 mois',
        'contract': 'Stage',
        'salary': '5000',
        'place': 'île de France',
        'publish_date': '15/05/2025',
        'alert': '',
      },
      {
        'id': '2',
        'title': 'Designer UI',
        'image':
            'assets/offers_images/original-a76def72cdea25d560956e824f479901.png',
        'publish_date': '15/03/2025',
        'alert': 'Cette offres à expirée il y a deux jours ',
        'description': '',
        'duration': '2 mois',
        'salary': '',
        'contract': 'Stage',
        'content': '',
        'place': 'île de France',
        'profil': ['']
      },
      {
        'id': '3',
        'title': 'Gestionnaire du réseuax',
        'image': 'assets/offers_images/conception-reseaux__1100.jpg',
        'description': '',
        'contract': 'Stage',
        'publish_date': '15/03/2025',
        'place': 'île de France',
        'duration': '2 mois',
        'content': '',
        'salary': '740-574',
        'alert': '',
        'profil': ['']
      },
      {
        'id': '4',
        'title': 'Développeur mobile flutter',
        'image':
            'assets/offers_images/avntages-inconvennients-flutter-application-mobile-hybride_banner.jpg',
        'publish_date': '15/01/2025',
        'place': 'Afrique',
        'description': '',
        'contract': 'CDI',
        'duration': '2 mois',
        'alert': 'Cette offres a expirée',
        'content': '',
        'salary': '140',
        'profil': ['']
      },
    ];
    // Simule un délai de réseau
    await Future.delayed(const Duration(seconds: 2));

    // Simule une erreur de 20% du temps
    double randomValue = _random.nextDouble();
    if (randomValue < 0.025) {
      throw JobOfferNetworkException('Erreur réseau');
    } else if (randomValue < 0.05) {
      throw JobOfferServerException('Erreur server');
    }
    List<JobOffer> jobList =
        listOfOffers.map((item) => jsonToJobOffer(item)).toList();
    return jobList;
  }

  @override
  Future<JobOffer> getSingleJobOffer(String id) {
    // TODO: implement getSingleJobOffer
    throw UnimplementedError();
  }

  @override
  Future<List<JobOffer>> getFirstJobOfferPage() {
    // TODO: implement getFirstJobOfferPage
    throw UnimplementedError();
  }

  @override
  Future<List<JobOffer>> getFirstJobOffersPage() {
    // TODO: implement getFirstJobOffersPage
    throw UnimplementedError();
  }

  @override
  Future<List<JobOffer>> getNextJobOffersPage(String lastDocumentId) {
    // TODO: implement getNextJobOffersPage
    throw UnimplementedError();
  }

  @override
  Future<List<JobOffer>> getNthJobOffersPage(int nPage) {
    // TODO: implement getNthJobOffersPage
    throw UnimplementedError();
  }

  @override
  Future<int> getNumberJobOffersPage() {
    // TODO: implement getNumberJobOffersPage
    throw UnimplementedError();
  }

  @override
  Future<List<JobOffer>> getPreviousJobOffersPage(String firstDocumentId) {
    // TODO: implement getPreviousJobOffersPage
    throw UnimplementedError();
  }
}
