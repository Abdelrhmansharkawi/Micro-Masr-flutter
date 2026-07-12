import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.trim().isNotEmpty) {
      context.go(
        Uri(
          path: AppRouteConstants.passengerRides,
          queryParameters: {'query': query.trim()},
        ).toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.aw),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.mic_none, color: context.colors.primary, size: 24.aw),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              onSubmitted: _onSearch,
              decoration: InputDecoration(
                hintText: AppStrings.whereToToday,
                hintStyle: context.bodyLargeTextStyle
                    .copyWith(color: context.colors.textSecondary),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.ah),
              ),
              style: context.bodyLargeTextStyle
                  .copyWith(color: context.colors.onSurface),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => _onSearch(_controller.text),
            child: Icon(Icons.search,
                color: context.colors.textSecondary, size: 24.aw),
          ),
        ],
      ),
    );
  }
}
