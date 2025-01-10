import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monizo_app/core/theme/app_colors.dart';

class HeaderCurveContainer extends StatelessWidget {
  const HeaderCurveContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SmoothCurveClipper(),
      child: Container(
        width: double.infinity,
        height: 287.h,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
      ),
    );
  }
}

class SmoothCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Alt sol köşe
    path.lineTo(0, size.height - 45.h);

    // İlk eğri (sol kenar ve orta arasında)
    path.quadraticBezierTo(
      size.width * 0.3, size.height - 22.h, // İlk kontrol noktası
      size.width / 2, size.height - 22.h, // Orta nokta
    );

    // İkinci eğri (orta ve sağ kenar arasında)
    path.quadraticBezierTo(
      size.width * 0.7, size.height - 22.h, // İkinci kontrol noktası
      size.width, size.height - 45.h, // Sağ alt köşe
    );

    // Üst köşelere çizgiler
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
