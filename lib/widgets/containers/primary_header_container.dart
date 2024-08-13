import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';
import '../curved/curved_edges_widgets.dart';
import 'circular_container.dart';

class primaryheadercontainer extends StatelessWidget {
  const primaryheadercontainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ecomcurvededgewidget(
      child: Container(
        color: AppColors.blue_blue,
        padding: const EdgeInsets.all(0),

          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child:
              TcircularContainer(backgroundColor: Colors.white.withOpacity(0.1))),
              Positioned(top: 100, right: -300, child:
              TcircularContainer(backgroundColor: Colors.white.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      );
  }
}

