abstract class SearchCepState {}

class SearchCepSucess implements SearchCepState {
  final Map data;

  const SearchCepSucess(this.data);
}

class SearchCepLoading implements SearchCepState {
  const SearchCepLoading();
}

class SearchCepError implements SearchCepState {
  final String message;

  const SearchCepError(this.message);
}