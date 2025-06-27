import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../domain/entities/onboarding_entity.dart';

List<OnboardingEntity> onboardingData = [
  OnboardingEntity(
    title: StringsManager.onboardingTitle1,
    subTitle: StringsManager.onboardingSubTitle1,
    image: AssetsManager.quran,
  ),
  OnboardingEntity(
    title: StringsManager.onboardingTitle2,
    subTitle: StringsManager.onboardingSubTitle2,
    image: AssetsManager.doaa,
  ),
  OnboardingEntity(
    title: StringsManager.onboardingTitle3,
    subTitle: StringsManager.onboardingSubTitle3,
    image: AssetsManager.radio,
  ),
];
