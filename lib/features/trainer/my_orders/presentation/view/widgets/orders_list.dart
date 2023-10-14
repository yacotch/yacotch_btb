import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/controller/booking_request_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/order_details.dart';

class BookingList extends StatelessWidget {
  final bool selectedCard;
  final BookingRequestCubit bloc;
  const BookingList({Key? key, required this.bloc, required this.selectedCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingRequestCubit, BookingRequestState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetBookingRequestsLoading) {
            return const Loader();
          } else if (state is GetBookingRequestsLoaded) {
            return bloc.bookingRequests.isEmpty
                ? Center(
                    child: Text(
                        LanguageHelper.getTranslation(context).no_data_found))
                : ListView.builder(
                    itemCount: bloc.bookingRequests.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardDetails(
                            bloc: bloc,
                            selectedCard: selectedCard,
                            bookingRequestModel: bloc.bookingRequests[index]),
                      );
                    });
          }
          return const SizedBox();
        });
  }
}
