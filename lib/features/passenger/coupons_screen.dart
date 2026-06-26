import 'package:flutter/material.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/coupon_item.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'كوبونات الخصم'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            CouponItem(
              title: 'خصم المشوار الأول',
              discount: 'خصم ٥٠٪',
              expiry: '٣٠ مايو ٢٠٢٦',
              onActivate: () {},
            ),
            CouponItem(
              title: 'عرض الويك إند',
              discount: 'خصم ٢٠ ج.م',
              expiry: '١٥ مايو ٢٠٢٦',
              onActivate: () {},
            ),
            CouponItem(
              title: 'كوبون رمضان كريم',
              discount: 'مشوار مجاني',
              expiry: '١٠ مايو ٢٠٢٦',
              onActivate: () {},
            ),
          ],
        ),
      ),
    );
  }
}











