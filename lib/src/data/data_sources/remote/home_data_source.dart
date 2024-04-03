import 'package:dio/dio.dart';

class HomeDataSourceRemote {
  final Dio _dio;

  HomeDataSourceRemote(this._dio);

  Future<Response> getPokemonList(int offset, int limit) async {
    final response = await _dio
        .get('https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=$limit');

    return response;
  }

  Future<Response> getPokemonDetail(int id) async {
    final response = await _dio.get('https://pokeapi.co/api/v2/pokemon/$id');
    return response;
  }
}
