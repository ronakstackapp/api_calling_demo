import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child:const  SpinKitCircle(
          color: Colors.green,
          size: 42,
        ),
      ),
    );
  }
}
