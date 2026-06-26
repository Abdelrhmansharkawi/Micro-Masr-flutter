import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/contact_option_card.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'تواصل معنا'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            ContactOptionCard(
              icon: Icons.phone_in_talk_rounded,
              label: 'رقم الهاتف',
              value: '١٩٠٠٠',
              color: Colors.blue,
              onTap: () {},
            ),
            const VerticalSpace(16),
            ContactOptionCard(
              icon: Icons.chat_bubble_rounded,
              label: 'واتساب',
              value: '+٢٠١٠٠٠٠٠٠٠٠٠',
              color: Colors.green,
              onTap: () {},
            ),
            const VerticalSpace(16),
            ContactOptionCard(
              icon: Icons.email_rounded,
              label: 'البريد الإلكتروني',
              value: 'support@micromasr.com',
              color: Colors.orange,
              onTap: () {},
            ),
            const VerticalSpace(24),
            
            // Address Card
            AppCard(
              padding: EdgeInsets.all(16.aw),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الفرع الرئيسي',
                        style: context.titleLargeTextStyle.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const VerticalSpace(4),
                      Text(
                        'المنصورة، المشاية السفلية،\nبجوار نادي جزيرة الورد',
                        textAlign: TextAlign.right,
                        style: context.bodyMediumTextStyle.copyWith(
                          color: context.colors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const HorizontalSpace(16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Icon(Icons.location_on_rounded, color: context.colors.primary, size: 24.aw),
                  ),
                ],
              ),
            ),
            
            const VerticalSpace(32),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.aw, vertical: 10.ah),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.ar),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'يومياً من ٩ صباحاً حتى ١١ مساءً',
                    style: context.bodyMediumTextStyle.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold),
                  ),
                  const HorizontalSpace(8),
                  Icon(Icons.access_time_rounded, color: Colors.lightGreen, size: 20.aw),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}











