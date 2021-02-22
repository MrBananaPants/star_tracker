import 'package:condition/condition.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

bool timerStatus = true;
bool buttonThema = true;

void changeThemeToAAN() => buttonThema = false;
void changeThemeToUIT() => buttonThema = true;

void setTimerToAAN() {
  timerStatus = true;
  buttonThema = false;
}

void setTimerToUIT() {
  timerStatus = false;
  buttonThema = true;
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              pinned: false,
              expandedHeight: 50.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Instellingen (niet functioneel)',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontFamily: 'SF',
                  ),
                ),
                centerTitle: false,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(left: 13, right: 13, top: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Timer',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                              ),
                            ),
                          ),
                          Container(
                            child: Conditioned(
                              cases: [
                                Case(
                                  buttonThema == true,
                                  builder: () => ButtonBar(
                                    buttonHeight: 40,
                                    buttonMinWidth:
                                        SizeConfig.blockSizeHorizontal * 38,
                                    alignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlineButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Text(
                                          'AAN',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .color,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            changeThemeToAAN();
                                          });
                                        },
                                      ),
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        color: Color(0xFF3D5AFE),
                                        child: const Text('UIT'),
                                        onPressed: () {
                                          setState(() {
                                            changeThemeToUIT();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Case(
                                  buttonThema == false,
                                  builder: () => ButtonBar(
                                    buttonHeight: 40,
                                    buttonMinWidth:
                                        SizeConfig.blockSizeHorizontal * 38,
                                    alignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        color: Color(0xFF3D5AFE),
                                        child: const Text('AAN'),
                                        onPressed: () {
                                          setState(
                                            () {
                                              changeThemeToAAN();
                                            },
                                          );
                                        },
                                      ),
                                      OutlineButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'UIT',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .color,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              changeThemeToUIT();
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              defaultBuilder: () => Text("Null value returned"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
