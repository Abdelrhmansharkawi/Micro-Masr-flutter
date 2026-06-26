import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'search_header.dart';
import 'location_input_card.dart';
import 'saved_places.dart';
import 'recent_locations.dart';
import 'popular_destinations.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchHeader(),
              VerticalSpace(24),
              LocationInputCard(),
              VerticalSpace(32),
              SavedPlaces(),
              VerticalSpace(32),
              RecentLocations(),
              VerticalSpace(32),
              PopularDestinations(),
            ],
          ),
        ),
      ),
    );
  }
}











