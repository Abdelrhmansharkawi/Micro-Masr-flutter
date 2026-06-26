import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'data/models/popular_destination_model.dart';
import 'data/services/popular_destinations_service.dart';

class PopularDestinations extends StatefulWidget {
  const PopularDestinations({super.key});

  @override
  State<PopularDestinations> createState() => _PopularDestinationsState();
}

class _PopularDestinationsState extends State<PopularDestinations> {
  final PopularDestinationsService _service = PopularDestinationsService();
  List<PopularDestinationModel> _destinations = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDestinations();
  }

  Future<void> _loadDestinations() async {
    final destinations = await _service.getPopularDestinations();
    if (mounted) {
      setState(() {
        _destinations = destinations;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                width: 4.aw, height: 20.ah, color: context.colors.primary),
            const HorizontalSpace(8),
            Text(
              AppStrings.popularDestinationsTitle,
              style: context.headlineMediumTextStyle.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const VerticalSpace(16),
        if (_loading)
          const Center(child: CircularProgressIndicator())
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _destinations
                  .map((dest) => _buildChip(context, dest.name))
                  .toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouteConstants.passengerRides);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(100),
          border:
              Border.all(color: context.colors.outline.withValues(alpha: 0.5)),
        ),
        child: Text(
          label,
          style: context.bodyMediumTextStyle
              .copyWith(color: context.colors.onSurface),
        ),
      ),
    );
  }
}
