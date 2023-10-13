<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/controller/subscription_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/widgets/item.dart';
import '../../../../../core/ui/loader.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key, required this.typeUser})
      : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          appBar: TransparentAppBar(
            title: LanguageHelper.getTranslation(context).subscription_plans,
          ),
          body: BlocProvider(
            create: (context) => SubscriptionCubit()..getSubscriptions(context),
            child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
              builder: (context, state) {
                if (state is GetSubscriptionsLoading) {
                  return const Loader();
                } else {
                  return ListView.separated(
                      itemCount:
                          SubscriptionCubit.of(context).subscriptions.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SubscriptionItem(
                              backGroundColor: const Color(0xffD8D8D8),
                              typeUser: typeUser,
                              subscriptionModel: SubscriptionCubit.of(context)
                                  .subscriptions[index]),
                        );
                      });
                }
              },
            ),
          )),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/controller/subscription_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/widgets/item.dart';
import '../../../../../core/ui/loader.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key, required this.typeUser})
      : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          appBar: TransparentAppBar(
            title: LanguageHelper.getTranslation(context).subscription_plans,
          ),
          body: BlocProvider(
            create: (context) => SubscriptionCubit()..getSubscriptions(context),
            child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
              builder: (context, state) {
                if (state is GetSubscriptionsLoading) {
                  return const Loader();
                } else {
                  return ListView.separated(
                      itemCount:
                          SubscriptionCubit.of(context).subscriptions.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SubscriptionItem(
                              backGroundColor: const Color(0xffD8D8D8),
                              typeUser: typeUser,
                              subscriptionModel: SubscriptionCubit.of(context)
                                  .subscriptions[index]),
                        );
                      });
                }
              },
            ),
          )),
    );
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
