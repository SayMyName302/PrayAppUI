import 'package:flutter/material.dart';
import 'package:my_flutterapp/controllers/cardViewScroll.dart';

import '../consts/const.dart';

class sleepPage extends StatelessWidget {
  const sleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
         Container(
           child: SingleChildScrollView(
                 
              scrollDirection: Axis.horizontal,
              child: Row(
                  
              children: List.generate(7, (index) => Column(
                children: [
                  
              HorizontalScroll(image: listImages[index],),
              
              
                ],
                
              )
              
              ),
              
              ),
              
            ),
         );
      
    
  }
}