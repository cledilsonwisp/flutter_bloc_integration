import 'package:bloc_empresas/modules/bloc_avancado/bloc_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/native_imp.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioForNative{

}
void main() {

  final dio = DioMock();


  blocTest(
    'deve retornar uma cidade quando passar o cep de parametro',
    build: () => BlockBlock(dio)
    
  );
}