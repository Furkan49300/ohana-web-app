import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/mock/job_offer_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/usecases/job_offer_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_state.dart';

class JobOfferBloc extends Bloc<CarreersEvent, JobOfferState> {
  JobOfferBloc() : super(JobOfferInitialState()) {
    on<FetchAllJobOfferEvent>((event, emit) async {
      try {
        // Récupérer les offres
        final List<JobOffer> allJobOffers = await JobOfferUsecase(
                jobOffersRepository: JobOfferHardCodedRepository())
            .getAllJobOffers();

        // Retourner les offres
        emit(AllJobOffersStates(allJobOffers));
      } catch (error) {
        // Gérer les erreurs
        emit(JobOfferError(error.toString())); // Affiche un message d'erreur
      }
    });
  }
}
