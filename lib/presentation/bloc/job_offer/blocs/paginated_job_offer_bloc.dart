import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/job_offer_firebase_repository.dart';

import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/usecases/job_offer_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_state.dart';

class PaginatedJobOfferBloc extends Bloc<JobOfferEvent, JobOfferState> {
  PaginatedJobOfferBloc() : super(JobOfferInitialState()) {
    on<FetchFirstJobOfferPage>(_fetchFirstJobOffersPage);
    on<FetchNextJobOffersPage>(_fetchNextJobOffersPage);
    on<FetchPreviousJobOffersPage>(_fetchPreviousJobOffersPage);
    on<FetchNthJobOffersPage>(_fetchNthJobOffersPage);
  }

  void _fetchFirstJobOffersPage(FetchFirstJobOfferPage event, emit) async {
    try {
      // Récupérer les offres
      final List<JobOffer> allJobOffers = await JobOfferUsecase(
              jobOffersRepository: JobOfferFirebaseRepository())
          .getFirstJobOffersPage();

      // Retourner les offres
      emit(JobOfferLoaded(allJobOffers));
    } catch (error) {
      // Gérer les erreurs
      emit(JobOfferError(error.toString())); // Affiche un message d'erreur
    }
  }

  void _fetchNextJobOffersPage(FetchNextJobOffersPage event, emit) async {
    try {
      // Récupérer les offres
      final List<JobOffer> jobOffersList = await JobOfferUsecase(
              jobOffersRepository: JobOfferFirebaseRepository())
          .getNextJobOffersPage(event.lastDocumentId);

      // Retourner les offres
      emit(JobOfferLoaded(jobOffersList));
    } catch (error) {
      // Gérer les erreurs
      emit(JobOfferError(error.toString())); // Affiche un message d'erreur
    }
  }

  void _fetchPreviousJobOffersPage(
      FetchPreviousJobOffersPage event, emit) async {
    try {
      // Récupérer les offres
      final List<JobOffer> jobOffersList = await JobOfferUsecase(
              jobOffersRepository: JobOfferFirebaseRepository())
          .getPreviousJobOffersPage(event.firstDocumentId);

      // Retourner les offres
      emit(JobOfferLoaded(jobOffersList));
    } catch (error) {
      // Gérer les erreurs
      emit(JobOfferError(error.toString())); // Affiche un message d'erreur
    }
  }

  void _fetchNthJobOffersPage(FetchNthJobOffersPage event, emit) async {
    try {
      // Récupérer les offres
      final List<JobOffer> jobOffersList = await JobOfferUsecase(
              jobOffersRepository: JobOfferFirebaseRepository())
          .getNthJobOffersPage(event.numberPage);

      // Retourner les offres
      emit(JobOfferLoaded(jobOffersList));
    } catch (error) {
      // Gérer les erreurs
      emit(JobOfferError(error.toString())); // Affiche un message d'erreur
    }
  }
}
