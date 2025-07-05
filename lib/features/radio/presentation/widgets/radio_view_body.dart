import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:just_audio/just_audio.dart';

class RadioViewBody extends StatefulWidget {
  const RadioViewBody({super.key});

  @override
  State<RadioViewBody> createState() => _RadioViewBodyState();
}

class _RadioViewBodyState extends State<RadioViewBody> {
  final AudioPlayer _player = AudioPlayer();

  final String _radioUrl =
      'https://n0e.radiojar.com/8s5u5tpdtwzuv?rj-ttl=5&rj-tok=AAABjW7yROAA0TUU8cXhXIAi6g';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setUrl(_radioUrl);
    } catch (e) {
      print('Error loading stream: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AssetsManager.radioBackground, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: Column(
            children: [
              Center(child: Image.asset(AssetsManager.homeLogo)),
              SizedBox(height: AppSize.s10),
              Center(child: Image.asset(AssetsManager.radio)),
              Container(
                width: AppSize.s350,
                height: AppSize.s150,
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Spacer(),
                        Image.asset(AssetsManager.radioButtonBackground),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            StringsManager.quranKareemRadio,
                            style: StylesManager.textStyle36(
                              ColorManager.white,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s10),
                        StreamBuilder<bool>(
                          stream: _player.playingStream,
                          builder: (context, snapshot) {
                            final isPlaying = snapshot.data ?? false;
                            return IconButton(
                              onPressed: () {
                                isPlaying ? _player.pause() : _player.play();
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                size: AppSize.s55,
                                color: ColorManager.black,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
