import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/controller/booking_request_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/filter_item.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/orders_list.dart';

import '../../../../../generated/l10n.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({Key? key}) : super(key: key);

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).my_orders,
      ),
      body: BlocProvider(
          create: (context) => BookingRequestCubit()..getBookingRequests(0),
          child: BlocBuilder<BookingRequestCubit, BookingRequestState>(
              builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 60.h,
                  child: Row(
                    children: [
                      FilterTabItem(
                          index: 1,
                          label: LanguageHelper.getTranslation(context).pending,
                          tabbed: BlocProvider.of<BookingRequestCubit>(context)
                              .tabbed,
                          onTap: () {
                            setState(() {
                              BlocProvider.of<BookingRequestCubit>(context)
                                  .updateCurrentTap(1);
                              BlocProvider.of<BookingRequestCubit>(context)
                                  .getBookingRequests(0);
                              tabController!.animateTo(0);
                            });
                          }),
                      FilterTabItem(
                          index: 2,
                          label:
                              LanguageHelper.getTranslation(context).approved,
                          tabbed: BlocProvider.of<BookingRequestCubit>(context)
                              .tabbed,
                          onTap: () {
                            setState(() {
                              BlocProvider.of<BookingRequestCubit>(context)
                                  .updateCurrentTap(2);
                              BlocProvider.of<BookingRequestCubit>(context)
                                  .getBookingRequests(1);
                              tabController!.animateTo(1);
                            });
                          }),
                      FilterTabItem(
                          index: 3,
                          label:
                              LanguageHelper.getTranslation(context).cancelled,
                          tabbed: BlocProvider.of<BookingRequestCubit>(context)
                              .tabbed,
                          onTap: () => setState(() {
                                BlocProvider.of<BookingRequestCubit>(context)
                                  ..updateCurrentTap(3)
                                  ..getBookingRequests(2);
                                tabController!.animateTo(2);
                              })),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: <Widget>[
                      BookingList(
                          selectedCard: false,
                          bloc: BlocProvider.of<BookingRequestCubit>(context)),
                      BookingList(
                          selectedCard: true,
                          bloc: BlocProvider.of<BookingRequestCubit>(context)),
                      BookingList(
                          selectedCard: true,
                          bloc: BlocProvider.of<BookingRequestCubit>(context)),
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }
}
