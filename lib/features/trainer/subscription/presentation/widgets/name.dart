<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainee_restaurantapp/core/localization/localization_provider.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/data/models/subscription_model.dart';

class SubscriptionNameWidget extends StatelessWidget {
  const SubscriptionNameWidget({
    super.key,
    required this.subscriptionModel,
  });

  final SubscriptionModel subscriptionModel;

  @override
  Widget build(BuildContext context) {
    return Text(
        Provider.of<LocalizationProvider>(context).currentLanguage == 'ar'
            ? subscriptionModel.arName!
            : subscriptionModel.enName!,
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold));
  }
}
=======
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainee_restaurantapp/core/localization/localization_provider.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/data/models/subscription_model.dart';

class SubscriptionNameWidget extends StatelessWidget {
  const SubscriptionNameWidget({
    super.key,
    required this.subscriptionModel,
  });

  final SubscriptionModel subscriptionModel;

  @override
  Widget build(BuildContext context) {
    return Text(
        Provider.of<LocalizationProvider>(context).currentLanguage == 'ar'
            ? subscriptionModel.arName!
            : subscriptionModel.enName!,
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold));
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
