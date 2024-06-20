import 'package:ohana_webapp_flutter/data/repositories/firebase/search_data.dart';
import 'package:ohana_webapp_flutter/logic/repositories/search_data.dart';

class SearchDataUsecase {
  SearchDataRepository jobOffersRepository;

  SearchDataUsecase({SearchDataRepository? jobOffersRepository})
      : jobOffersRepository =
            jobOffersRepository ?? SearchDataFirebaseRepository();
}
