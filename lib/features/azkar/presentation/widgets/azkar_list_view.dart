import 'package:flutter/material.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/widgets/custom_divider.dart';
import 'package:islami/features/azkar/data/models/azkar_list_item_model.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_list_view_item.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AzkarListItemModel> azkarItems = [
      AzkarListItemModel(
        title: StringsManager.morningAzkar,
        apiKey: 'morning_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.eveningAzkar,
        apiKey: 'evening_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.azkarAfterPraying,
        apiKey: 'prayer_later_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.miscellaneous,
        apiKey: 'miscellaneous_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.sleepingAzkar,
        apiKey: 'sleep_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.wakingUpAzkar,
        apiKey: 'wake_up_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.khalaAzkar,
        apiKey: 'khala_azkar',
        customDivider: const CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.hajjAndUmrahAzkar,
        apiKey: 'hajj_and_umrah_azkar',
        customDivider: const CustomDivider(),
      ),
    ];
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = azkarItems[index];
        return AzkarListViewItem(azkarListItemModel: item);
      },
      itemCount: azkarItems.length,
    );
  }
}
