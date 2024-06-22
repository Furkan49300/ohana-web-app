import 'package:equatable/equatable.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';

abstract class JobOfferState extends Equatable {
  List<Object> get props => [];
}

class JobOfferInitialState extends JobOfferState {}

class JobOfferLoaded extends JobOfferState {
  final List<JobOffer> jobOffersList;
  JobOfferLoaded(this.jobOffersList);
}

//SINGLE JOB OFFER

class SingleJobOfferLoaded extends JobOfferState {
  final JobOffer jobOffers;
  SingleJobOfferLoaded(this.jobOffers);
}

class JobOfferError extends JobOfferState {
  final String errorMessage;

  JobOfferError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
