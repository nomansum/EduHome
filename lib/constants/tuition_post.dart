import 'package:flutter/material.dart';

class TuitionCard extends StatelessWidget {
  
  final Widget child;
  final double cardHeight,cardWidth;
  TuitionCard({required this.child , required this.cardHeight,required this.cardWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color:Colors.greenAccent.shade100
        ,
        borderRadius: BorderRadius.circular(20.0),
         border: Border.all(
          color:Colors.green.shade600,
         )
      ),
      child: child,
    );
  }
}