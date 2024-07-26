import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void haulLog(dynamic msg) {
  log(
    msg.toString(),
  );
}

extension SizeExtension on double {
  // double dynV() => (h - 72);
  double get dynH => h;
  double get dynW => w;

  double get dynFont => sp;
}
