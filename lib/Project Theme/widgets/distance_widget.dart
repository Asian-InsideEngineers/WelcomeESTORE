import 'package:flutter/cupertino.dart';

class DistanceWidget extends StatelessWidget {
  const DistanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 10,
    );
  }
}
