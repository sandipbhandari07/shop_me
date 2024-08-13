import 'package:flutter/material.dart';
import 'package:wucommerce/widgets/curved/curved_edges.dart';

class ecomcurvededgewidget extends StatelessWidget {
  const ecomcurvededgewidget({
    super.key, required this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: EcommcustomCurvedEdges(),
      child: child,
    );
  }
}
