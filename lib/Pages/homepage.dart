import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_flutterapp/consts/const.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:my_flutterapp/controllers/homePageCardData.dart';
import 'package:my_flutterapp/controllers/videoplayer.dart';
import 'package:my_flutterapp/controllers/cardViewScroll.dart';
import 'package:my_flutterapp/controllers/smallcardview.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
  
    return Flex(
      direction: Axis.vertical,
      children:[Expanded(
        
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
            title: const Text('Home'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
          ),
            
          body: SingleChildScrollView(
            child: Container(
              
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                            (index) => "Menu Items"
                                .text
                                .color(Colors.white)
                                .makeCentered()
                                .box.hexColor("#454242")
                                .rounded
                                .size(150, 32).shadowSm
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .make()),
                                
                      )
                      ),
                        20.heightBox,
                        Row(children: List.generate(1, (index) => cardView(
          height:context.screenHeight*0.146,
          width:context.screenWidth/2.5,
          
                        )),
                        ),
                        20.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: prayTv.text.bold.size(18).make()
                          ,
                         
                          
                          ),
                          
          
           SizedBox(
              height:context.screenHeight*0.3,
          width:context.screenWidth/0.3,
              child: VideoPlayer(),
              
            )
            ,
             20.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: newreleases.text.bold.size(18).make()
                          ,
                         
                          
                          ),
            20.heightBox,
          SingleChildScrollView(
        
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
          20.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: previews.text.bold.size(18).make()
                          ,
                         
                          
                          ),
                          20.heightBox,
                          SingleChildScrollView(
        
            scrollDirection: Axis.horizontal,
            child: Row(
                  
              children: List.generate(7, (index) => Column(
                children: [
                  
            smallScroll(image: listImages[index],),
            
              
                ],
                
              )
              
              ),
              
            ),
            
          ),
          20.heightBox,
          
          
                ],
                
                
              ),
              
              
              
            ),
            
          ),
        
    
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                gap: 8,
                padding: EdgeInsets.all(16),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: home,
                  ),
                  GButton(
                    icon: Icons.search,
                    text: search,
                  ),
                  GButton(
                    icon: Icons.read_more,
                    text: read,
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: pray,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ]
    );
  
  }
}
