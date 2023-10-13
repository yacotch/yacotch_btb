<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/data/models/subscription_model.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class SubscriptionPriceWidget extends StatelessWidget {
  const SubscriptionPriceWidget({
    super.key,
    required this.subscriptionModel,
  });

  final SubscriptionModel subscriptionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${subscriptionModel.fee ?? 0}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Text(Translation.of(context).saudi_riyal,
            style: const TextStyle(color: Colors.black, fontSize: 14)),
      ],
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/data/models/subscription_model.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class SubscriptionPriceWidget extends StatelessWidget {
  const SubscriptionPriceWidget({
    super.key,
    required this.subscriptionModel,
  });

  final SubscriptionModel subscriptionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${subscriptionModel.fee ?? 0}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Text(Translation.of(context).saudi_riyal,
            style: const TextStyle(color: Colors.black, fontSize: 14)),
      ],
    );
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
