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
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.eveningAzkar,
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.azkarAfterPraying,
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.tsabeh,
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.sleepingAzkar,
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.wakingUpAzkar,
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.quranyDouaa,
        customDivider: CustomDivider(),
      ),
      AzkarListItemModel(
        title: StringsManager.prophetsDouaa,
        customDivider: CustomDivider(),
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
