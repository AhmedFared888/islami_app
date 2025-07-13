import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = 'https://api.alquran.cloud/v1/';
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}

class AudioService {
  final _player = AudioPlayer();
  final String _radioUrl = 'https://n0e.radiojar.com/8s5u5tpdtwzuv';

  Stream<bool> get playingStream => _player.playingStream;

  Future<void> toggle() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.setUrl(_radioUrl);
      await _player.play();
    }
  }

  void dispose() {
    _player.dispose();
  }
}

class AzkarDetailsService {
  final Dio _dio;
  final baseUrl = 'https://alquran.vip';
  AzkarDetailsService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
