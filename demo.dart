import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
                Text('usduwkjwnkjncwkjcnw',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
