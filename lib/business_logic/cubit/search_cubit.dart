import 'package:bloc/bloc.dart';
import 'package:senjayer/data/models/event.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(
          SearchState(isSearching: false, searchResult: []),
        );

  void toogleIsSearching(bool isSearching) {
    emit(
      SearchState(
        isSearching: isSearching,
        searchResult: [],
      ),
    );
  }

  void search(String textToSearch) {
    if(textToSearch.toLowerCase() == "concert"){
      emit(
      SearchState(
        isSearching: true,
        searchResult: demoEventListEvents,
      ),
    );
    }else{
      emit(
      SearchState(
        isSearching: true,
        searchResult: [],
      ),
    );
    }
  }
}
