import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/data/repositories/firebase/job_offer_firebase_repository.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/blocs/paginated_job_offer_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_state.dart';

import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomJobOfferSmartPaginator extends StatefulWidget {
  CustomJobOfferSmartPaginator({super.key});

  @override
  State<CustomJobOfferSmartPaginator> createState() =>
      _CustomBlogPostSmartPaginatorState();
}

class _CustomBlogPostSmartPaginatorState
    extends State<CustomJobOfferSmartPaginator> {
  int currentPageIndex = 1;
  bool previousPageDisabled = true;
  bool nextPageDisabled = false;
  int startIndicator = 1; // default value
  int endIndicator = 0; //default value
  late int jobOfferaginatingNumber;
  final wrong = '';

  @override
  void initState() {
    super.initState();
    _getEndIndicator();
  }

  void _getEndIndicator() async {
    jobOfferaginatingNumber =
        await JobOfferFirebaseRepository().getNumberJobOffersPage();
    setState(() {
      endIndicator = jobOfferaginatingNumber < 4 ? jobOfferaginatingNumber : 4;
      nextPageDisabled = jobOfferaginatingNumber <= 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        _previousPage(),
        for (var i = startIndicator; i <= endIndicator; i++) _getNthPage(i),
        const SizedBox(width: 10),
        _nextPage(),
        Text(wrong)
      ],
    );
  }

  _previousPage() {
    return Button(
      '<',
      type: previousPageDisabled ? ButtonType.disabled : ButtonType.number,
      onTap: () {
        if (!previousPageDisabled) {
          JobOfferState currentState =
              context.read<PaginatedJobOfferBloc>().state;
          if (currentState is JobOfferLoaded) {
            context.read<PaginatedJobOfferBloc>().add(
                FetchPreviousJobOffersPage(
                    currentState.jobOffersList.first.id));
          }
          setState(() {
            if (currentPageIndex > 1) {
              if (currentPageIndex == startIndicator && startIndicator != 1) {
                int previousEndIndicator = endIndicator;
                endIndicator = startIndicator;
                startIndicator =
                    ((startIndicator - 4) > 0 && previousEndIndicator != 4)
                        ? (startIndicator - 4)
                        : 1;
              }
              currentPageIndex--;
              previousPageDisabled = currentPageIndex == 1;
              nextPageDisabled = false;
              _updateIndicatorOnPreviousPage();
            }
          });
        }
      },
    );
  }

  _updateIndicatorOnPreviousPage() {
    if (currentPageIndex == startIndicator && startIndicator != 1) {
      endIndicator = startIndicator;
      startIndicator = ((startIndicator - 4) > 0 && endIndicator != 4)
          ? (startIndicator - 4)
          : 1;
    }
  }

  _getNthPage(i) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Button(
          i.toString(),
          type: currentPageIndex == i ? ButtonType.disabled : ButtonType.number,
          onTap: () {
            context
                .read<PaginatedJobOfferBloc>()
                .add(FetchNthJobOffersPage(numberPage: i));
            setState(() {
              currentPageIndex = i; // get the current page index
              previousPageDisabled =
                  currentPageIndex == 1; // Disable previous button
              nextPageDisabled = currentPageIndex ==
                  jobOfferaginatingNumber; // Disable next button
            });
          },
        ));
  }

  _nextPage() {
    return Button(
      '>',
      type: nextPageDisabled ? ButtonType.disabled : ButtonType.number,
      onTap: () {
        if (!nextPageDisabled) {
          JobOfferState currentState =
              context.read<PaginatedJobOfferBloc>().state;
          if (currentState is JobOfferLoaded) {
            context.read<PaginatedJobOfferBloc>().add(
                FetchNextJobOffersPage(currentState.jobOffersList.last.id));
          }
          setState(() {
            _updateIndicatorOnNextPage();
            currentPageIndex++;
            nextPageDisabled = currentPageIndex == endIndicator;
            previousPageDisabled = false;
          });
        }
      },
    );
  }

  _updateIndicatorOnNextPage() {
    if (currentPageIndex == endIndicator) {
      if ((jobOfferaginatingNumber - currentPageIndex) < 4) {
        startIndicator = endIndicator;
        endIndicator = jobOfferaginatingNumber;
      } else {
        startIndicator = endIndicator;
        endIndicator = endIndicator + 4;
      }
    }
  }
}
