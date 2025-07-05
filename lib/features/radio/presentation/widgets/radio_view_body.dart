import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/features/radio/domain/entities/audio_state%20.dart';
import 'package:islami/features/radio/domain/usecases/toggle_radio_use_case.dart';

class RadioViewBody extends StatefulWidget {
  const RadioViewBody({super.key});

  @override
  State<RadioViewBody> createState() => _RadioViewBodyState();
}

class _RadioViewBodyState extends State<RadioViewBody> {
  final AudioService _audioService = AudioService();
  late final ToggleRadioUseCase _toggleUseCase;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _toggleUseCase = ToggleRadioUseCase(_audioService);
  }

  Future<void> _togglePlayPause() async {
    final result = await _toggleUseCase.execute();
    if (!mounted) return;
    result.fold((failure) => print('Error: ${failure.message}'), (
      AudioState state,
    ) {
      if (!mounted) return;
      setState(() {
        _isPlaying = state.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    _audioService.dispose(); // Important to stop the player
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
              const SizedBox(height: AppSize.s10),
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
                        const Spacer(),
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
                        const SizedBox(height: AppSize.s10),
                        IconButton(
                          onPressed: _togglePlayPause,
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: AppSize.s55,
                            color: ColorManager.black,
                          ),
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
