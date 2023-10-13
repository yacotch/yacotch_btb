import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/controller/booking_request_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/order_details.dart';

class BookingList extends StatelessWidget {
  final bool selectedCard;
  final Function() ontap;
  const BookingList(this.ontap, {Key? key, required this.selectedCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingRequestCubit, BookingRequestState>(
        builder: (context, state) {
      if (state is GetBookingRequestsLoading) {
        return const Loader();
      } else if (state is GetBookingRequestsLoaded) {
        return ListView.builder(
            itemCount: BookingRequestCubit.of(context).bookingRequests.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardDetails(() => ontap,
                    selectedCard: selectedCard,
                    bookingRequestModel:
                        BookingRequestCubit.of(context).bookingRequests[index]),
              );
            });
      }
      return const SizedBox();
    });
  }
}
