import 'dart:async';
import 'package:dio/dio.dart';
import 'block_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockBlock extends Bloc<String, SearchCepState2> {
  final Dio dio;
  BlockBlock(this.dio) : super(SearchCepSucess2({}));

  @override
  Stream<SearchCepState2> mapEventToState(String cep) async* {
    yield const SearchCepLoading2();
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      yield SearchCepSucess2(response.data);
    } catch (e) {
      yield const SearchCepError2('Deu erro');
    }
  }

  // final _streamController = StreamController<String>.broadcast();
  // Sink<String> get searchCep => _streamController.sink;
  // Stream<SearchCepState2> get cepResult =>
  //     _streamController.stream.switchMap(_searchCep);

  // Stream<SearchCepState2> _searchCep(String cep) async* {
  //   yield const SearchCepLoading2();
  //   try {
  //     final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
  //     yield SearchCepSucess2(response.data);
  //   } catch (e) {
  //     yield const SearchCepError2('Deu erro');
  //   }
  // }
  // void dispose() {
  //   _streamController.close();
  // }
}
