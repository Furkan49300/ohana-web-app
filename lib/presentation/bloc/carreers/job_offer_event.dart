abstract class JobOfferEvent {}

class FetchAllJobOfferEvent extends JobOfferEvent {}

//SINGLE JOB OFFER

class FetchSingleJobOfferPage extends JobOfferEvent {
  final String id;
  FetchSingleJobOfferPage(this.id);
}

// PAGINATED JOB OFFERS
class FetchFirstJobOfferPage extends JobOfferEvent {}

class FetchPreviousJobOffersPage extends JobOfferEvent {
  final String firstDocumentId;
  FetchPreviousJobOffersPage(this.firstDocumentId);
}

class FetchNextJobOffersPage extends JobOfferEvent {
  final String lastDocumentId;
  FetchNextJobOffersPage(this.lastDocumentId);
}

class FetchNthJobOffersPage extends JobOfferEvent {
  int numberPage;
  FetchNthJobOffersPage({required this.numberPage});
}

//-----------
