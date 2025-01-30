
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gaurav_portfolio/global/functions.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:pretty_animated_buttons/widgets/pretty_shadow_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/DataModel.dart';
import '../constants/app_color.dart';
import '../constants/functions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isScrolled = false;
  ScrollController controller = ScrollController();
  ScrollController horizontalController = ScrollController();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<DataModel> data = [
    DataModel(
      title: "Flutter",
      subtitle: "Expertise in dart language using flutter framework"
    ),

    DataModel(
      title: "State Management",
      subtitle: "Riverpod, Provider, Getx"

    ),
    DataModel(
        title: "IDE",
        subtitle: "Android studio, VScode, Cursor, xcode",

    ),
    DataModel(
        title: "Other Programming Languages",
        subtitle: "Java, C#, PHP, node js",

    ),

    DataModel(
      title: "Other Frameworks",
      subtitle: "Laravel, codeigniter, unity",

    ),
    DataModel(
        title: "Flames",
        subtitle: "basics of game development using flames in flutter",

    ),
    DataModel(
      title: "Database",
      subtitle: "Sqf lite, Hive, mongodb",
    ),

    DataModel(
      title: "Firebase",
      subtitle: "Expertise in projects using firebase in flutter",

    ),
    DataModel(
      title: "CI/CD",
      subtitle: "git, svn, github, bitbucket, sourcetree",

    ),
    DataModel(
      title: "Work Management Tools",
      subtitle: "Slack, trello, jira",

    ),
  ];

  List<DataModel> projects = [
    DataModel(
        title: "Nerbio iTOF App",
        image: "assets/itof/icon.png",
        subtitle: "iTOF nerbio device is a neuromuscular blockade monitor which is used by medical professionals during surgery"
            "to monitor neuromuscular blockage sending electric pulse through electrodes in their nerves and an accelerometer "
            "is placed to measure their twitch."
            " The iTOF app is to control the device like managing the modes and showing the twitch response for the doctors in form of graph and "
            "twitch ratio. You can control the power of electric bursts and frequency etc. using this app."
    ),

    DataModel(
        title: "State Management",
        subtitle: "Riverpod, Provider, Getx"

    ),
    DataModel(
      title: "IDE",
      subtitle: "Android studio, VScode, Cursor, xcode",

    ),
    DataModel(
      title: "Other Programming Languages",
      subtitle: "Java, C#, PHP, node js",

    ),

    DataModel(
      title: "Other Frameworks",
      subtitle: "Laravel, codeigniter, unity",

    ),
    DataModel(
      title: "Flames",
      subtitle: "basics of game development using flames in flutter",

    ),
    DataModel(
      title: "Database",
      subtitle: "Sqf lite, Hive, mongodb",
    ),

    DataModel(
      title: "Firebase",
      subtitle: "Expertise in projects using firebase in flutter",

    ),
    DataModel(
      title: "CI/CD",
      subtitle: "git, svn, github, bitbucket, sourcetree",

    ),
    DataModel(
      title: "Work Management Tools",
      subtitle: "Slack, trello, jira",

    ),
  ];

  storeData() async{
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    await _firebaseFirestore.collection("data").add(webBrowserInfo.data.map((key, value) {return MapEntry(key, value.toString());}));
    await _firebaseFirestore.collection("user").add(deviceInfo.data.map((key, value) {return MapEntry(key, value.toString());}));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      print(controller.offset);

      if(controller.offset == 0){
        isScrolled = false;
      }else{
        isScrolled = true;
      }
      setState(() {

      });
    });

    storeData();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Stack(
          children: [
            Container(
              height: getHeight(context),
              width: getWidth(context),

              decoration: BoxDecoration(

                color: Colors.blueAccent,

              ),
              alignment: Alignment.topCenter,

              child:  Container(

                height: getHeight(context)/2,
                width: getWidth(context),

                decoration: BoxDecoration(

                    color: Colors.blueAccent,
                    image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage(
                        "assets/profile.jpg"
                    )
                )
                ),

              ).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1)),

            ),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                color: isScrolled?Colors.black.withOpacity(0.5):Colors.transparent
            ),
              height: getHeight(context),
              width: getWidth(context),
              child: Scrollbar(
                controller: controller,
                interactive: true,
                child: SingleChildScrollView(
                  physics:BouncingScrollPhysics(),
                  controller: controller,
                  child: Column(
                
                    children: [
                      SizedBox(
                        height: getHeight(context)/2,
                        width: getWidth(context),
                       ),

                      AnimatedContainer(
                        duration: Duration(
                          seconds: 1
                        ),
                        height: getHeight(context)/2,
                        width: getWidth(context),
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                         // color: (isScrolled)?AppColor.LIGHT_BLUE:AppColor.DARK_BLUE,

                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                (isScrolled)?AppColor.LIGHT_BLUE:AppColor.DARK_BLUE,
                                (isScrolled)?Colors.white:Colors.blueAccent
                              ]

                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),

                        padding: EdgeInsets.all(20),

                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text("Gaurav Negi",
                                    style: GoogleFonts.monda(
                                        color:(isScrolled)?Colors.black:Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50
                                    ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),
                                  ),
                              
                                  FittedBox(
                                    child: Container(

                                      child: Text("Flutter Developer", style: GoogleFonts.monda(
                                        color:(isScrolled)?Colors.black:Colors.white,
                                        fontSize:30,

                                      ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),
                                    ),
                                  ),
                              
                                  SizedBox(height: 10,),
                                  Container(
                                    child: FittedBox(
                                      child: Text("+91-9149243123", style: TextStyle(
                                        color: (isScrolled)?Colors.black:Colors.white,
                                        fontSize:20,
                                      ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),
                                    ),
                                  ),
                              
                                  SizedBox(height: 10,),
                                  Container(
                                    child: FittedBox(
                                      child: Text("gaurav8negi9@gmail.com", style: TextStyle(
                                        color: (isScrolled)?Colors.black:Colors.white,
                                        fontSize:20,
                                      ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: AnimatedContainer(
                                duration: Duration(
                                    seconds: 1
                                ),
                                height: getHeight(context)/2,
                                width: getWidth(context) * 0.5,
                                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  // color: (isScrolled)?AppColor.LIGHT_BLUE:AppColor.DARK_BLUE,
                              
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          (isScrolled)?AppColor.DARK_BLUE:AppColor.LIGHT_BLUE,
                                          (isScrolled)?Colors.blueAccent:Colors.white
                                        ]
                              
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              
                                padding: EdgeInsets.all(20),
                              
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("50",
                                      style: GoogleFonts.monda(
                                          color:(isScrolled)?Colors.white:Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 50
                                      ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),

                                    FittedBox(
                                      child: Text("Projects",
                                        style: GoogleFonts.monda(
                                            color:(isScrolled)?Colors.white:Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50
                                        ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),
                                    ),

                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),


                      SizedBox(height: 10,),
                      AnimatedContainer(
                        duration: Duration(
                            seconds: 1
                        ),
                        height: getHeight(context)/2,
                        width: getWidth(context),
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  (isScrolled)?AppColor.darkBlue:AppColor.DARK_BLUE,
                                  (isScrolled)?AppColor.DARK_BLUE:Colors.blueAccent
                                ]

                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),

                        child: Column(
                          children: [
                            Text("Skills",
                              style: GoogleFonts.monda(
                                  color:(isScrolled)?Colors.white:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40
                              ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),


                            Expanded(
                              child: Scrollbar(
                                interactive: true,
                                controller: horizontalController,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.length,
                                    controller: horizontalController,
                                    itemBuilder: (context, index)=>
                                    Container(
                                      height:(getHeight(context)/2) - 100,
                                      width: getWidth(context)*0.4,
                                      decoration: BoxDecoration(

                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              AppColor.DARK_BLUE,
                                              Colors.blueAccent
                                            ]

                                        ),
                                        borderRadius: BorderRadius.circular(10),


                                      ),
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if(data[index].title != null)
                                          FittedBox(
                                            child: Text("${data[index].title}", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30
                                            ),textAlign: TextAlign.center).animate().fadeIn(curve:Curves.easeIn,duration: Duration(seconds: 1)),
                                          ),
                                          if(data[index].subtitle != null)
                                          SizedBox(height: 10,),
                                          if(data[index].subtitle != null)
                                          Text("${data[index].subtitle}", style: TextStyle(
                                              color: Colors.white
                                          ), textAlign: TextAlign.center).animate().fadeIn(curve:Curves.easeIn,duration: Duration(seconds: 1)),
                                          if(data[index].content != null)
                                          SizedBox(height: 10,),
                                          if(data[index].content != null)
                                          Text("${data[index].content}", style: TextStyle(
                                              color: Colors.white
                                          ), textAlign: TextAlign.center,).animate().fadeIn(curve:Curves.easeIn,duration: Duration(seconds: 1))
                                        ],
                                      ),
                                    ).animate().scale(duration: Duration(seconds: 1)))
                              ),
                            ),
                          ],
                        ),

                      ),


                    SizedBox(height: 10,),



                      AnimatedContainer(
                        duration: Duration(
                            seconds: 1
                        ),
                        height: getHeight(context),
                        width: getWidth(context),
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  (isScrolled)?AppColor.darkBlue:AppColor.DARK_BLUE,
                                  (isScrolled)?AppColor.DARK_BLUE:Colors.blueAccent


                                ]

                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),

                        child: Column(
                          children: [
                            Text("Projects",
                              style: GoogleFonts.monda(
                                  color:(isScrolled)?Colors.white:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40
                              ),).animate().fadeIn(curve:Curves.easeInCubic,duration: Duration(seconds: 1,)),


                            Expanded(
                              child: Scrollbar(
                                  interactive: true,
                                  controller: horizontalController,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: projects.length,
                                      controller: horizontalController,
                                      itemBuilder: (context, index)=>
                                          Container(
                                            height:(getHeight(context)/2) - 100,
                                            width: (isDesktop(context))?getWidth(context)*0.5:getWidth(context)*0.8,
                                            decoration: BoxDecoration(
                              
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    AppColor.DARK_BLUE,
                                                    Colors.blueAccent
                                                  ]
                              
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                              
                              
                                            ),
                                            padding: EdgeInsets.all(20),
                                            margin: EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                (projects[index].image != null)?
                                                  Expanded(
                                                    flex: 1,

                                                    child: Container(
                                                      width: getWidth(context),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        gradient:
                                                       LinearGradient(
                                                        begin: Alignment.topLeft,
                                                           end: Alignment.bottomRight,
                                                           colors: [
                                                         AppColor.darkBlue,
                                                         AppColor.DARK_BLUE
                                                       ]),

                                                        image: DecorationImage(
                                                          image: AssetImage(projects[index].image!)
                                                        )
                                                      ),
                                                    ),
                                                  ): Expanded(
                                                  flex: 1,
                  //new
                                                    child: Container(
                                                      width:getWidth(context),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topLeft,
                                                          end: Alignment.bottomRight,
                                                          colors: [
                                                            AppColor.darkBlue,
                                                            AppColor.DARK_BLUE
                                                          ]),

                                                    ),
                                                    
                                                    child: Icon(
                                                      Icons.image,
                                                      size: 100,
                                                      color: Colors.white,
                                                      
                                                    ),
                                                                                                    ),
                                                  ),
                                                SizedBox(height: 10,),

                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    children: [
                                                      if(projects[index].title != null)
                                                        FittedBox(
                                                          child: Text("${projects[index].title}", style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 30
                                                          ),textAlign: TextAlign.center).animate().fadeIn(curve:Curves.easeIn,duration: Duration(seconds: 1)),
                                                        ),
                                                      if(projects[index].subtitle != null)
                                                        SizedBox(height: 10,),
                                                      if(projects[index].subtitle != null)
                                                        Text("${projects[index].subtitle}", style: TextStyle(
                                                            fontSize: isDesktop(context)?getHeight(context)*0.02:getHeight(context)*0.015,
                                                            color: Colors.white
                                                        ), textAlign: TextAlign.center).animate().fadeIn(curve:Curves.easeIn,duration: Duration(seconds: 1)),
                                                      if(projects[index].content != null)
                                                        SizedBox(height: 10,),
                                                      if(projects[index].content != null)
                                                        Text("${projects[index].content}", style: TextStyle(
                                                            color: Colors.white
                                                        ), textAlign: TextAlign.center,).animate().fadeIn(curve:Curves.easeIn,duration: Duration(seconds: 1)),


                                                      SizedBox(height: 10,),


                                                  
                                                    ],
                                                  ),
                                                ),

                                                Wrap(
                                                  alignment: WrapAlignment.center,
                                                  crossAxisAlignment: WrapCrossAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: PrettyShadowButton(

                                                        label: "Images",
                                                        onPressed: () {
                                                          setState(() {

                                                          });
                                                        },
                                                        icon: Icons.arrow_forward,
                                                        shadowColor: Colors.cyanAccent,
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: PrettyShadowButton(

                                                        label: "Link",
                                                        onPressed: () {

                                                          if(projects[index].link != null){
                                                            launchUrl(Uri.parse(projects[index].link!));
                                                          }
                                                          setState(() {

                                                          });


                                                        },
                                                        icon: Icons.arrow_forward,
                                                        shadowColor: Colors.cyanAccent,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ],
                                            ),
                                          ).animate().scale(duration: Duration(seconds: 1)))
                              ),
                            ),
                          ],
                        ),

                      ),


                    ],
                
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
