import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_state.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/blocs/paginated_job_offer_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomJobOfferSmartPaginator extends StatefulWidget {
  const CustomJobOfferSmartPaginator(
      {super.key, required this.startIndicator, required this.endIndicator});
  final int startIndicator;
  final int endIndicator;

  @override
  State<CustomJobOfferSmartPaginator> createState() =>
      _CustomJobOfferSmartPaginatorState();
}

class _CustomJobOfferSmartPaginatorState
    extends State<CustomJobOfferSmartPaginator> {
  int currentPageIndex = 0;
  bool previousPageDisabled = true;
  bool nextPageDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        _previousPage(),
        for (var i = widget.startIndicator; i <= widget.endIndicator; i++)
          _getNthPage(i),
        const SizedBox(width: 10),
        _nextPage(),
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
              currentPageIndex--;
              previousPageDisabled = currentPageIndex == widget.startIndicator;
              nextPageDisabled = false;
            }
          });
        }
      },
    );
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
                  false; //disabel the light effect on the previous button
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
            currentPageIndex = currentPageIndex + 1;
            nextPageDisabled = currentPageIndex == widget.endIndicator;
            previousPageDisabled = false;
          });
        }
      },
    );
  }
}
