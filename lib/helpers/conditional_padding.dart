import 'package:smart_car/helpers/responsive.dart';

double conditionalResponsiveDouble({required double mobile, required double tablet, required double desktop , required context}) {
  if(Responsive.isMobile(context)){
    return mobile;
  } else if (Responsive.isTablet(context)){
    return tablet;
  } else {
    return desktop;
  }
}