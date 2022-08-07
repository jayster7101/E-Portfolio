import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Jayden Jardine Portfolio',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  snap: false,
                  floating: false,
                  pinned: true,
                  expandedHeight: ((MediaQuery.of(context).size.height) * .10),
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello my name is ",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Colors.white,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText(
                                "Jayden Jardine",
                                textStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.white,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.bold),
                              ),
                              WavyAnimatedText(
                                "Jayden Jardine",
                                textStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.white,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      background: Image.asset(
                        'assets/images/James_webb.jpeg',
                        fit: BoxFit.cover,
                      )),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //color: Colors.black,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 0),
                          child: Center(
                            child: Text("About me",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 22)),
                          ),
                        ),
                        ExpandablePanel(
                            theme: const ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                iconPadding: EdgeInsets.all(0)),
                            header: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                "Interests:",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.visible),
                              ),
                            ),
                            collapsed: SizedBox.shrink(),
                            expanded: Column(
                              children: [
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Crypto",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Text(
                                          "I first heard about bitcoin in 2015, during my freshman year of highschool. At this time I had no clue what a blockchain was nor did I have any money to invest in it, but I did have this deep desire and profound feeling that it would be impactful. During my freshman year I did loads of research to get a better understanding of what is was and how it worked. After months of research I tried to convince my family to invest when the price was around 1800 dollars... After a few years I would become more and more interested in this technology and start to invest alot of my money into it as well as develop Dapps on the Ethereum network.",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              overflow: TextOverflow.visible)),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Fitness",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Text(
                                          "Throughout highschool I was overweight and didnt takecare of health and was uninformed on sustainable eating habits. This changed during my senior year of highschool after a good freind of my tunred me on to working out and kicking junk food. I then dove deep into the sport of weight lifting and prioritized nutrition. Over then next 3 years I went from being 240lb's and overweight to an incredibly conditioned and healthy athlete.",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              overflow: TextOverflow.visible)),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Gene Editing",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Text("I am keen on gene editing and its potential to improve the human condition. I am motivated by the possibility of using this technology to cure genetic disorders and improve human health. Biohacking is a subset of gene editing that excites me, it can be used to perfect human evolution and optimize many functions in the body.",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              overflow: TextOverflow.visible)),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "AI",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Text("Artificial intelligence interests me because it is an area that has the potential to revolutionize so many aspects of our lives. With the rapid advancements in the field, AI has the ability to change the way we live, work, and play. I am excited to explore the possibilities that artificial intelligence presents and to be a part of its future development. In all honesty, this statement was written by an AI. I created a small application that uses openAI's davinci model.",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              overflow: TextOverflow.visible)),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Aerospace",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Text("Spaceflight, especially the exploration and colonization of other planets, has always intrigued me. Even as a small child, I was captivated by the idea of people traveling to other worlds. And while movies and books often depict spacecraft as sleek and sexy machines, the reality is that most of the work of spaceflight is actually done by software. Software plays a critical role in spaceflight, from the ground control systems that communicate with and direct spacecraft, to the onboard computers that control navigation and operate the spacecraft's systems. Software is also essential for mission planning and analysis, and for the development of new spacecraft technologies. I look forward to seeing the role of software continue to grow and evolve as we explore new worlds and extend humanity's reach into the cosmos.",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              overflow: TextOverflow.visible)),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            }),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //   child: Row(children: [
                        //     Expanded(
                        //       child: RichText(
                        //         text: TextSpan(children: <TextSpan>[
                        //           TextSpan(
                        //             text: "- But why?",
                        //             style: TextStyle(
                        //                 fontFamily: 'Montserrat',
                        //                 fontSize: 16,
                        //                 color: Colors.black,
                        //                 fontWeight: FontWeight.bold,
                        //                 overflow: TextOverflow.visible),
                        //           ),
                        //           TextSpan(
                        //             text:
                        //                 " My main goal in life has always been to do as much good as possible and impact the most amount of people in a postive way. Computer science has the highest odds of accomplishing my dreams and just so happend to be something im inordinately passionate about.",
                        //             style: TextStyle(
                        //                 fontFamily: 'Montserrat',
                        //                 fontSize: 16,
                        //                 color: Colors.black,
                        //                 overflow: TextOverflow.visible),
                        //           )
                        //         ]),
                        //       ),
                        //     ),
                        //   ], crossAxisAlignment: CrossAxisAlignment.start),
                        //   color: Colors.blueAccent,
                        // ),

                        ExpandablePanel(
                            theme: const ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                iconPadding: EdgeInsets.all(0)),
                            header: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Major: ',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Computer Science",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            collapsed: SizedBox.shrink(),
                            // HEREEEEe
                            expanded: Column(
                              children: [
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Reason",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Text(
                                        "My main goal in life has always been to do as much good as possible and impact the most amount of people in a postive way. Computer science has the highest odds of accomplishing my dreams and just so happend to be something im inordinately passionate about.",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            color: Colors.black,
                                            overflow: TextOverflow.visible),
                                      ),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                                ExpandableNotifier(
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                          iconPadding: EdgeInsets.all(0)),
                                      header: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Future plans",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible),
                                        ),
                                      ),
                                      collapsed: SizedBox.shrink(),
                                      expanded: Column(
                                        children: [
                                          ExpandableNotifier(
                                            child: ExpandablePanel(
                                                theme: const ExpandableThemeData(
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    tapBodyToCollapse: true,
                                                    iconPadding:
                                                        EdgeInsets.all(0)),
                                                header: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "Short term",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .visible),
                                                  ),
                                                ),
                                                collapsed: SizedBox.shrink(),
                                                expanded: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    "\u25cf This coming semester (fall 2022), I will be founding a club centered around blockchain development. We will explore how different blockchains work and develep Dapps(Decentralised Applications) on the Ethereum network using Solidity smart contracts.\n\u25cf Moving forward I plan to continually find internship opportunities as well as possible part time jobs within the tech industry.",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .visible),
                                                  ),
                                                ),
                                                builder:
                                                    (_, collapsed, expanded) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 0),
                                                    child: Expandable(
                                                      collapsed: collapsed,
                                                      expanded: expanded,
                                                      theme:
                                                          const ExpandableThemeData(
                                                              crossFadePoint:
                                                                  0),
                                                    ),
                                                  );
                                                }),
                                          ),
                                          ExpandableNotifier(
                                            child: ExpandablePanel(
                                                theme: const ExpandableThemeData(
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    tapBodyToCollapse: true,
                                                    iconPadding:
                                                        EdgeInsets.all(0)),
                                                header: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "Long term",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .visible),
                                                  ),
                                                ),
                                                collapsed: SizedBox.shrink(),
                                                expanded: Text(
                                                  "\u25cf After graduating from Ohlone College with an Associates degree in computer science I will continue my education by obtaining both a bachelors and masters degree in computer science/related fields. I aspire to attend Stanford or Berkeley as they are my dream schools.\n\u25cf Once graduted from my masters program, I will join a company and work full time. After a few years of experience I plan to switch to a more manegerial position in order to aquire a different set of skills.\n\u25cf Now with a background in programming and managment, I will venture off into my biggest aspiration of all, creating a business that truly contributes to the greater good of humainty",
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      overflow:
                                                          TextOverflow.visible),
                                                ),
                                                builder:
                                                    (_, collapsed, expanded) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 0),
                                                    child: Expandable(
                                                      collapsed: collapsed,
                                                      expanded: expanded,
                                                      theme:
                                                          const ExpandableThemeData(
                                                              crossFadePoint:
                                                                  0),
                                                    ),
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                      // Text(
                                      //   "I have big plans and even bigger dreams. I will continually work towards my goal of postively impacting the world",
                                      //   style: TextStyle(
                                      //       fontFamily: 'Montserrat',
                                      //       fontSize: 16,
                                      //       color: Colors.black,
                                      //       overflow: TextOverflow.visible),
                                      // ),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 0),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            }),
                        Divider(
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                          child: Center(
                            child: Text("Projects",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 22)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                      iconPadding: EdgeInsets.all(0)),
                                  header: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                "Refugee App (Internship)",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.visible),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/SCU_homescreen.jpeg',
                                              height: 100,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                      )),
                                  collapsed: SizedBox.shrink(),
                                  expanded: Text(
                                    "\u25cf 2022 Summer internship at Santa Clara University's Frugal Innovation Hub.\n\u25cf The app is centered around helping newly displaced refugees adapt to foreign environments by providing many relevant tools in one area.\n\u25cf It was designed and developed over a 10 week period with a partner.\n\u25cf Tools: Figma(UI/UX), Flutter(Front end), Dart(Backend), Github(Version control)",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                  builder: (_, collapsed, expanded) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 0),
                                      child: Expandable(
                                        collapsed: collapsed,
                                        expanded: expanded,
                                        theme: const ExpandableThemeData(
                                            crossFadePoint: 0),
                                      ),
                                    );
                                  }),
                            ),
                            Expanded(
                              child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                      iconPadding: EdgeInsets.all(0)),
                                  header: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                "Ethereum Dapp",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.visible),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/Sol.jpeg',
                                              fit: BoxFit.scaleDown,
                                              height: 100,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                      )),
                                  collapsed: SizedBox.shrink(),
                                  expanded: Text(
                                    "\u25cf This was a fully functioning application on the Ethereum blockchain.\n\u25cf I learned in depth how the Etherum Blockchain works and how it could be leveraged to revolutionize modern financial systems.\n\u25cf Many new technologies were used to create this project, Solidty for the smart contracts code, React for the front end, Javascipt for the back end, Web3 to connect the backend to the Etherum node (infura), and truffle as my wallet provider.\n\u25cf Sadly this project no longer runs, all the technologies have updated faster than I can maintain. It was still a great experience and has encouraged me to create a club on campus. It provide a motivating space for blockchain enthusiasts.",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                  builder: (_, collapsed, expanded) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 0),
                                      child: Expandable(
                                        collapsed: collapsed,
                                        expanded: expanded,
                                        theme: const ExpandableThemeData(
                                            crossFadePoint: 0),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                      iconPadding: EdgeInsets.all(0)),
                                  header: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5, top: 5),
                                              child: Text(
                                                "UN Sustainability Lab",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.visible),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/Zero.png',
                                              height: 100,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                      )),
                                  collapsed: SizedBox.shrink(),
                                  expanded: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            "\u25cf The UN Sustainability Lab was a group project that I led. We were given data that represented a delivery trucks route that would serve local pop ups.\n\u25cf We were tasked with creating the business logic for the delviery system which included optimizing the routes.\n\u25cfOur soultion was non recursive and only optimsied for the next best stop.",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            color: Colors.black,
                                            overflow: TextOverflow.visible)),
                                    TextSpan(
                                      text: "\n\u25cf link to project\n",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.blue,
                                          overflow: TextOverflow.visible),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (() => {
                                              launchUrlString(
                                                  'https://replit.com/@JaydenJardine/cs116GroupProjecttrial#helpers.cpp') /**launchUrl(Uri(scheme:"https", host: 'replit.com', path:'@JaydenJardine/cs116GroupProjecttrial#helpers.cpp'*))*/
                                            }),
                                    ),
                                    TextSpan(
                                      text: "\u25cfTo run type \"./run\"",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.black,
                                          overflow: TextOverflow.visible),
                                    )
                                  ])),
                                  builder: (_, collapsed, expanded) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 0),
                                      child: Expandable(
                                        collapsed: collapsed,
                                        expanded: expanded,
                                        theme: const ExpandableThemeData(
                                            crossFadePoint: 0),
                                      ),
                                    );
                                  }),
                            ),
                            Expanded(
                              child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                      iconPadding: EdgeInsets.all(0)),
                                  header: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                "E-Portfolio app",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.visible),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/this.png',
                                              height: 100,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                      )),
                                  collapsed: SizedBox.shrink(),
                                  expanded: Text(
                                    "\u25cf This entire portfolio was a project in its self. Many hours of work have been put into the project, its something I will continually update and expand on.",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                  builder: (_, collapsed, expanded) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 0),
                                      child: Expandable(
                                        collapsed: collapsed,
                                        expanded: expanded,
                                        theme: const ExpandableThemeData(
                                            crossFadePoint: 0),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),

                        // Container(
                        //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //   child: Row(children: [
                        //     Expanded(
                        //       child: RichText(
                        //         text: TextSpan(children: <TextSpan>[
                        //           TextSpan(
                        //             text: "- But why?",
                        //             style: TextStyle(
                        //                 fontFamily: 'Montserrat',
                        //                 fontSize: 16,
                        //                 color: Colors.black,
                        //                 fontWeight: FontWeight.bold,
                        //                 overflow: TextOverflow.visible),
                        //           ),
                        //           TextSpan(
                        //             text:
                        //                 " My main goal in life has always been to do as much good as possible and impact the most amount of people in a postive way. Computer science has the highest odds of accomplishing my dreams and just so happend to be something im inordinately passionate about.",
                        //             style: TextStyle(
                        //                 fontFamily: 'Montserrat',
                        //                 fontSize: 16,
                        //                 color: Colors.black,
                        //                 overflow: TextOverflow.visible),
                        //           )
                        //         ]),
                        //       ),
                        //     ),
                        //   ], crossAxisAlignment: CrossAxisAlignment.start),
                        //   color: Colors.blueAccent,
                        // ),

                        Divider(
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                          child: Center(
                            child: Text("Skills",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 22)),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "Technical",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  Text(
                                    "C++",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                  Text(
                                    "Dart/Flutter",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                  Text(
                                    "Javascript/CSS/HTML",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                  Text(
                                    "Solidity (beginner)",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text("Intrapersonal",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),
                                  ),
                                  Text("Leadership",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16)),
                                  Text("Strong work Ethic",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16)),
                                  Text("Team Work",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16)),
                                  Text("Disciplined",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16)),
                                ],
                              ),
                            )
                          ],
                        ),

                        Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        Container(
                          height: 200,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],

          // Container(
          //   height: 200,
          //   color: Colors.red,
          // ),
          // Container(
          //   height: 200,
          //   color: Colors.red,
          // ),
          // Container(
          //   height: 200,
          //   color: Colors.red,
          // )
        ),
      ),
      //drawer: Drawer(),
    );
  }
}
