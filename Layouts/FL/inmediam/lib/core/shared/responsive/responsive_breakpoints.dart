import 'package:flutter/material.dart';

/// Define os limites de largura para cada categoria de dispositivo
class Breakpointes {
  static const double mobileMax = 600.0;
  static const double tabletMax = 1024.0;
}

/// Extensão para injetar propriedades de responsividade diretamente no Context
extension ResponsiveContext on BuildContext {
  // Atalhos para tamanho da tela
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Verificadores de tipo de tela
  bool get isMobile => screenWidth <= Breakpointes.mobileMax;

  bool get isTablet =>
      screenWidth > Breakpointes.mobileMax &&
      screenWidth <= Breakpointes.tabletMax;

  bool get isDesktop => screenWidth > Breakpointes.tabletMax;

  // Retorna um valor específico baseado no tipo de tela atual
  // Excelente para mudar paddings, tamanhos de fonte ou cantos arredondados
  T responsiveValue<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
}
