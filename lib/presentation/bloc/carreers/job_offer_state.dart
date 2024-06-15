import 'package:equatable/equatable.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';

abstract class JobOfferState extends Equatable {
  List<Object> get props => [];
}

class AllJobOffersStates extends JobOfferState {
  final List<JobOffer> jobOffers;
  AllJobOffersStates(this.jobOffers);
}

class JobOfferInitialState extends JobOfferState {}

class JobOfferError extends JobOfferState {
  final String errorMessage;

  JobOfferError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
