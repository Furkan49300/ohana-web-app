import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/data/repositories/firebase/job_offer_firebase_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/usecases/job_offer_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_state.dart';

class SingleJobOfferBloc extends Bloc<JobOfferEvent, JobOfferState> {
  SingleJobOfferBloc() : super(JobOfferInitialState()) {
    on<FetchSingleJobOfferPage>(_fetchSingleJobOffer);
    on<FetchSingleJobOfferType>(_fetchSingleJobOfferType);
  }
  void _fetchSingleJobOffer(FetchSingleJobOfferPage event, emit) async {
    try {
      // Récupérer l' offre
      final JobOffer jobOffers = await JobOfferUsecase(
              jobOffersRepository: JobOfferFirebaseRepository())
          .getSingleJobOffer(event.id);

      // Retourner l'offre
      emit(SingleJobOfferLoaded(jobOffers));
    } catch (error) {
      // Gérer les erreurs
      emit(JobOfferError(error.toString())); // Affiche un message d'erreur
    }
  }

  void _fetchSingleJobOfferType(FetchSingleJobOfferType event, emit) async {}
}
