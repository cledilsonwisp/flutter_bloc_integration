import 'dart:async';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'my_home_page_state.dart';

class MyHomePageBloc {
  final Dio dio;
  MyHomePageBloc({this.dio});

  final _streamController = StreamController<String>.broadcast();

  Sink<String> get searchCep => _streamController.sink;
  Stream<SearchCepState> get cepResult =>
      _streamController.stream.switchMap(_searchCep);

  Stream<SearchCepState> _searchCep(String cep) async* {
    yield const SearchCepLoading();
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      yield SearchCepSucess(response.data);
    } catch (e) {
      yield const SearchCepError('Deu erro');
    }
  }

  void dispose() {
    _streamController.close();
  }
}
