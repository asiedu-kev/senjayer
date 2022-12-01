part of 'search_cubit.dart';

class SearchState {
  final bool isSearching;
  final List<Event> searchResult;
  SearchState( {
    required this.isSearching,
    required this.searchResult,
  });
}
