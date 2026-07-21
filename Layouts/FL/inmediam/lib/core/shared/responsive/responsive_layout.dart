import 'package:flutter/cupertino.dart';
import 'package:inmediam/core/shared/responsive/responsive_breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Usamos as restrições do LayoutBuilder para maior precisão de layout interno
        if (constraints.maxWidth > Breakpointes.tabletMax) {
          return desktopBody ?? tabletBody ?? mobileBody;
        }

        if (constraints.maxWidth > Breakpointes.mobileMax) {
          return tabletBody ?? mobileBody;
        }

        return mobileBody;
      },
    );
  }
}
