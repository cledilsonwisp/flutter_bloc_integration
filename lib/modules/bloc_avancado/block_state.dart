import 'package:equatable/equatable.dart';

abstract class SearchCepState2 {}

class SearchCepSucess2 extends Equatable implements SearchCepState2 {
  final Map data;

  const SearchCepSucess2(this.data);

  @override
  List<Object> get props => [data];
}

class SearchCepLoading2 implements SearchCepState2 {
  const SearchCepLoading2();
}

class SearchCepError2 implements SearchCepState2 {
  final String message;

  const SearchCepError2(this.message);
}