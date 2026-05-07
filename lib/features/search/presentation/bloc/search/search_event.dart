abstract class SearchEvent {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class ExecuteSearch extends SearchEvent {
  const ExecuteSearch(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class ClearSearch extends SearchEvent {
  const ClearSearch();
}
