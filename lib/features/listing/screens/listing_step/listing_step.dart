import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../amenities/amenities.dart';
import '../checklist/checklist.dart';
import '../description/description.dart';
import '../name_and_city/name_and_city.dart';
import '../property_type/property_type.dart';

class ListingStageMobileScreen extends StatelessWidget {
  const ListingStageMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final storedValue = storage.read("listingStage");

    // Safety check and parse enum from stored string
    final listingStage = THelperFunctions.parseListingStage(storedValue);

    return Scaffold(
      body:
          listingStage != null
              ? _buildBookingStageWidget(listingStage)
              : _buildDefaultScreen(), // fallback if null
    );
  }

  Widget _buildBookingStageWidget(ListingStage listingStage) {
    switch (listingStage) {
      case ListingStage.StepOne:
        return _buildChecklistScreenWidget();
      case ListingStage.StepTwo:
        return _buildPropertyTypeStepWidget();
      case ListingStage.StepThree:
        return _buildNameAndCityWidget();
      case ListingStage.StepFour:
        return _buildDescriptionStepScreenWidget();
      case ListingStage.StepFive:
        return _buildAmenitiesWidget();
      case ListingStage.StepSix:
        return _buildCompletedWidget();
      case ListingStage.StepSeven:
        return _buildCompletedWidget();
      case ListingStage.StepEight:
        return _buildCompletedWidget();
      case ListingStage.StepNine:
        return _buildCompletedWidget();
      case ListingStage.StepTen:
        return _buildCompletedWidget();
      case ListingStage.StepEleven:
        return _buildCompletedWidget();
      case ListingStage.StepTwelve:
        return _buildCancelledWidget();
    }
  }

  Widget _buildDefaultScreen() {
    return const Center(child: Text("No stage data available"));
  }

  Widget _buildChecklistScreenWidget() {
    return const ChecklistScreen();
  }

  Widget _buildPropertyTypeStepWidget() {
    return const PropertyTypeScreen();
  }

  Widget _buildNameAndCityWidget() {
    return const NameAndCityScreen();
  }

  Widget _buildDescriptionStepScreenWidget() {
    return const DescriptionsScreen();
  }

  Widget _buildAmenitiesWidget() {
    return const AmenitiesScreen();
  }

  Widget _buildCompletedWidget() {
    return const ChecklistScreen();
  }

  Widget _buildCancelledWidget() {
    return const ChecklistScreen();
  }
}
