import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/driver/document_upload_card.dart';
import 'package:micromasr/features/driver/preferred_route_selector.dart';
import 'package:micromasr/features/driver/registration_documents_footer.dart';
import 'package:micromasr/features/driver/registration_app_bar.dart';
import 'package:micromasr/features/driver/registration_header.dart';
import 'package:micromasr/features/driver/registration_step_indicator.dart';

class RegisterDocumentsScreen extends StatefulWidget {
  const RegisterDocumentsScreen({super.key});
  @override
  State<RegisterDocumentsScreen> createState() => _RegisterDocumentsScreenState();
}

class _RegisterDocumentsScreenState extends State<RegisterDocumentsScreen> {
  bool _licenseUploaded = true, _idUploaded = false, _vehiclePhotoUploaded = false;
  String? _selectedRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: const RegistrationAppBar(title: AppStrings.driverRegisterTitle),
      body: SafeArea(
        top: false,
        child: Column(children: [
          Expanded(child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const RegistrationHeader(title: AppStrings.uploadDocumentsTitle, subtitle: AppStrings.uploadDocumentsSubtitle),
              SizedBox(height: AppSpacing.lg.ah),
              const RegistrationStepIndicator(currentStep: 1),
              SizedBox(height: AppSpacing.lg.ah),
              DocumentUploadCard(icon: Icons.badge_outlined, title: AppStrings.drivingLicense, subtitle: _licenseUploaded ? AppStrings.drivingLicenseUploaded : null, isUploaded: _licenseUploaded, onTap: () => setState(() => _licenseUploaded = !_licenseUploaded)),
              SizedBox(height: AppSpacing.md.ah),
              DocumentUploadCard(icon: Icons.insert_drive_file_outlined, title: AppStrings.nationalIdCard, subtitle: AppStrings.nationalIdCardSubtitle, isUploaded: _idUploaded, onTap: () => setState(() => _idUploaded = !_idUploaded)),
              SizedBox(height: AppSpacing.md.ah),
              DocumentUploadCard(icon: Icons.directions_car_outlined, title: AppStrings.vehiclePhoto, subtitle: AppStrings.vehiclePhotoSubtitle, isUploaded: _vehiclePhotoUploaded, onTap: () => setState(() => _vehiclePhotoUploaded = !_vehiclePhotoUploaded)),
              SizedBox(height: AppSpacing.lg.ah),
              PreferredRouteSelector(selectedRoute: _selectedRoute, onChanged: (r) => setState(() => _selectedRoute = r)),
              SizedBox(height: AppSpacing.xxl.ah),
            ]),
          )),
          RegistrationDocumentsFooter(onSubmit: () => context.go(AppRouteConstants.driverPending)),
        ]),
      ),
    );
  }
}











