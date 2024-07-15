import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/data/repositories/firebase/job_offer_firebase_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/logic/usecases/job_offer_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_state.dart';

class SingleJobOfferBloc extends Bloc<JobOfferEvent, JobOfferState> {
  SingleJobOfferBloc() : super(JobOfferInitialState()) {
    on<FetchSingleJobOfferPage>(_fetchSingleJobOffer);
    on<ResetJobOffer>(_resetJobOffer);
  }

  Future<void> _fetchSingleJobOffer(
      FetchSingleJobOfferPage event, Emitter<JobOfferState> emit) async {
    try {
      final JobOffer jobOffer = await JobOfferUsecase(
              jobOffersRepository: JobOfferFirebaseRepository())
          .getSingleJobOffer(event.id);

      if (jobOffer.id.isEmpty || jobOffer.title.isEmpty) {
        emit(JobOfferError("Données d'offre d'emploi invalides."));
      } else {
        emit(SingleJobOfferLoaded(jobOffer));
      }
    } catch (error) {
      emit(JobOfferError(error.toString()));
    }
  }

  void _resetJobOffer(ResetJobOffer event, Emitter<JobOfferState> emit) {
    emit(JobOfferInitialState());
  }
}

class ResetJobOffer extends JobOfferEvent {}
