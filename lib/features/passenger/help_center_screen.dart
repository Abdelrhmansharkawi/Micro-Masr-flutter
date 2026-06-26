import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/faq_item_tile.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  String selectedCategory = 'الكل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'مركز المساعدة'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            // Search Bar
            AppCard(
              padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
              child: Row(
                children: [
                  Icon(Icons.search, color: context.colors.textSecondary),
                  const Spacer(),
                  Text(
                    'كيف يمكننا مساعدتك؟',
                    style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                  ),
                ],
              ),
            ),
            const VerticalSpace(24),
            
            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['الكل', 'الحجز', 'الدفع', 'الأمان'].map((cat) => _buildCategory(cat)).toList(),
              ),
            ),
            const VerticalSpace(24),

            // FAQ List
            const FAQItemTile(
              question: 'كيف يمكنني حجز رحلة؟',
              answer: 'يمكنك حجز رحلة من خلال اختيار وجهتك من الصفحة الرئيسية وتحديد موعد الرحلة المناسب لك.',
            ),
            const FAQItemTile(
              question: 'ما هي طرق الدفع المتاحة؟',
              answer: 'نوفر عدة طرق للدفع تشمل الدفع النقدي، البطاقات الائتمانية، وفودافون كاش.',
            ),
            const FAQItemTile(
              question: 'كيف يمكنني إلغاء الحجز؟',
              answer: 'يمكنك إلغاء الحجز من خلال قائمة "رحلاتي" قبل موعد الرحلة بـ ٣٠ دقيقة على الأقل.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String label) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 12.aw),
        padding: EdgeInsets.symmetric(horizontal: 20.aw, vertical: 10.ah),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20.ar),
          boxShadow: [
            if (!isSelected)
              BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
          ],
        ),
        child: Text(
          label,
          style: context.bodySmallTextStyle.copyWith(
            color: isSelected ? Colors.white : context.colors.textSecondary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}











