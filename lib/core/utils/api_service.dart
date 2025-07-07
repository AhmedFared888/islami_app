import 'package:dio/dio.dart';
import 'package:islami/features/radio/domain/entities/audio_state.dart';
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

  bool _isPlaying = false;

  Future<AudioState> toggle() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      try {
        // set URL كل مرة لتفادي مشاكل في بعض الأجهزة/المحاكيات
        await _player.setUrl(_radioUrl);
      } catch (e) {
        // ممكن تتجاهله لو حصل قبل كده
        print('setUrl error: $e');
      }
      await _player.play();
    }

    _isPlaying = !_isPlaying;
    return AudioState(isPlaying: _isPlaying);
  }

  void dispose() {
    _player.dispose();
  }
}
