import 'package:flutter/material.dart';
import 'package:wucommerce/widgets/containers/primary_header_container.dart';

class HomescreenContent extends StatelessWidget {
  const HomescreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            primaryheadercontainer(
              child : Container(

              )
            ),
          ],
        ),
      ),
    );
  }
}



