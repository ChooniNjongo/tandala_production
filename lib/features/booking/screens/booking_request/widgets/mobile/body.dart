import 'package:cwt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/question_container/question_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/property/room.dart';

class BookingRequestBody extends StatefulWidget {
  final Room? room;

  const BookingRequestBody({super.key, required this.room});

  @override
  State createState() => _BookingRequestBodyState();
}

class _BookingRequestBodyState extends State<BookingRequestBody> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const QuestionContainer(question:"Start the booking process" , body: "Please select both check in and check out dates in that order. You can select by tapping the dates."),
          const SizedBox(height: TSizes.spaceBtwSections),
          TRoundedContainer(
            elevation: 2,
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            showBorder: true,
            borderColor: TColors.iconBorder,
            child: TableCalendar(
              headerStyle: HeaderStyle(
                leftChevronIcon:
                    const Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    const Icon(Icons.chevron_right, color: Colors.white),
                titleTextStyle: TTypography.label14Bold
                    .copyWith(color: TColorSystem.primary300),
                titleCentered: true,
              ),
              firstDay: DateTime(2023),
              lastDay: DateTime(3000),
              focusedDay: checkInDate ?? DateTime.now(),
              calendarFormat: _calendarFormat,
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              enabledDayPredicate: (day) {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                return !day.isBefore(today);
              },
              selectedDayPredicate: (day) {
                if (checkInDate == null) return false;

                if (checkOutDate == null) {
                  return day.isAtSameMomentAs(checkInDate!);
                }

                return day.isAfter(
                        checkInDate!.subtract(const Duration(days: 1))) &&
                    day.isBefore(checkOutDate!.add(const Duration(days: 1)));
              },
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: TColorSystem.n400, // White border color
                        width: 0.7, // Border thickness
                      ),
                    ),
                    child: Center(
                      child: Text(
                        day.day.toString(),
                        style: const TextStyle(
                          color: Colors.white, // Text visible on yellow
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, date, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: TColorSystem.primary500,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        date.day.toString(),
                        style: const TextStyle(
                          color: TColorSystem.n200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              onDaySelected: (selectedDay, focusedDay) {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);

                if (selectedDay.isBefore(today)) return;

                setState(() {
                  if (checkInDate == null ||
                      (checkInDate != null && checkOutDate != null)) {
                    checkInDate = selectedDay;
                    checkOutDate = null;
                  } else {
                    if (selectedDay.isAfter(checkInDate!)) {
                      checkOutDate = selectedDay;
                    } else {
                      checkInDate = selectedDay;
                      checkOutDate = null;
                    }
                  }

                  if (checkInDate != null && checkOutDate != null) {
                    controller.checkInDate.value = checkInDate!;
                    controller.checkOutDate.value = checkOutDate!;
                    controller.updateNumberOfNights(
                      checkInDate!,
                      checkOutDate!,
                      widget.room!.price.toInt(),
                    );
                  }
                });
              },
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
