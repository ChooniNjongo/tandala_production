import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../models/listing_stage.dart';
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
      case ListingStage.stepOne:
        return _buildChecklistScreenWidget();
      case ListingStage.stepTwo:
        return _buildPropertyTypeStepWidget();
      case ListingStage.stepThree:
        return _buildNameAndCityWidget();
      case ListingStage.stepFour:
        return _buildDescriptionStepScreenWidget();
      case ListingStage.stepFive:
        return _buildAmenitiesWidget();
      case ListingStage.stepSix:
        return _buildCompletedWidget();
      case ListingStage.stepSeven:
        return _buildCompletedWidget();
      case ListingStage.stepEight:
        return _buildCompletedWidget();
      case ListingStage.stepNine:
        return _buildCompletedWidget();
      case ListingStage.stepTen:
        return _buildCompletedWidget();
      case ListingStage.stepEleven:
        return _buildCompletedWidget();
      case ListingStage.stepTwelve:
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
