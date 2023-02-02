import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_flutterapp/consts/const.dart';
import 'package:my_flutterapp/controllers/horizontalScrollmenu.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:my_flutterapp/controllers/homePageCardData.dart';
import 'package:my_flutterapp/controllers/videoplayer.dart';
import 'package:my_flutterapp/controllers/cardViewScroll.dart';
import 'package:my_flutterapp/controllers/smallcardview.dart';
import  'package:my_flutterapp/Pages/Player.dart';
import 'package:my_flutterapp/Pages/prayPage.dart';
import 'package:my_flutterapp/Pages/readPage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int selectedIndex = 0;
  final List<String> menuItems = ["All", "Favorites", "Sleep", "Bible", "Plans","Old Testament", "Podcasts"];
   ScrollController _scrollController = ScrollController();
   @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        selectedIndex = (_scrollController.offset / 150).floor();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
            child: Column(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            7,
                            (index) =>GestureDetector(
                                   onTap: () {
                                    _scrollController.animateTo(
                          index * 100.0,
                          
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child:  menuItems[index].text.color(
                            selectedIndex == index ? Colors.black : Colors.white,
                          ) .makeCentered()
                          .box.hexColor(selectedIndex==index?"#FFFFFF":"#474747")
                          .rounded
                          .size(150, 32)
                          .shadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make(),
                            ) 
                        
                                
                        )
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
                       
                        
                        ).box.margin(const EdgeInsets.symmetric(horizontal: 15)).make(),
                        
          20.heightBox,
           const SizedBox(
           
            child: VideoPlayer(),
            
            ).box.size(350, 200).roundedSM.make()
            ,
             20.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: newreleases.text.bold.size(18).make()
                        ,
                       
                        
                        ).box.margin(const EdgeInsets.symmetric(horizontal: 15)).make(),
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
                       
                        
                        ).box.margin(const EdgeInsets.symmetric(horizontal: 15)).make(),
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
          Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child:ElevatedButton(
    
    
    style: ElevatedButton.styleFrom(
            backgroundColor:const Color.fromARGB(255, 207, 184, 34),
          ),
    
    
    onPressed: () {},
    child: const Text(
      "Unlock Pray Premium",
      style: TextStyle(color: Colors.black,),
    
    
    ),
    
    ),
    )
          
              ],
              
              
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
      tabs: [
        GButton(
          icon: Icons.home,
          text: home,
      
        ),
        GButton(
          icon: Icons.search,
          text: search,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sleepPage()),
            );
          },
        ),
        GButton(
          icon: Icons.read_more,
          text: read,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => readPage()),
            );
          },
        ),
        GButton(
          icon: Icons.favorite,
          text: pray,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => prayPage()),
            );
          },
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
