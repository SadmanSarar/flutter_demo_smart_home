import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/crontroller_page.dart';

void main() {
  runApp(MyApp());
}

final Color kColorGray = const Color(0xFF707070);
final Color kPrimaryColor = const Color(0xFF7366FE);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ControllerPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedNavButtonIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabLabels.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset(.5, 1.0),
      children: [
        Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 44,
              ),
              Row(
                children: [
                  SizedBox(width: 25),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset("assets/ic_menu.png"),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: kColorGray,
                    size: 30,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        "https://ath2.unileverservices.com/wp-content/uploads/sites/4/2017/09/rexfeatures-8975328av-500x500.jpg"),
                  ),
                  SizedBox(width: 25),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(width: 25),
                  Expanded(
                    child: Text(
                      "Smart Home Controller",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/ic_menu_2.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Image.asset("assets/ic_union.png"),
                  ),
                  SizedBox(width: 25),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Color(0xFF7366FE),
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                  labelPadding: EdgeInsets.zero,
                  indicatorWeight: 3,
                  isScrollable: true,
                  tabs: List.generate(tabLabels.length, (index) {
                    return Tab(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          left: 16,
                          right: 16,
                        ),
                        child: Text(tabLabels[index]),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(tabLabels.length, (index) {
                    return _buildControlPage(index);
                  }),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            color: Colors.transparent,
            height: 60.0,
            child: Row(
              children: [
                _buildBottomMenuItem("assets/ic_home.png", 0),
                _buildBottomMenuItem("assets/ic_smart_tv.png", 1),
                SizedBox(
                  width: 32,
                  height: 0,
                ),
                _buildBottomMenuItem("assets/ic_stats.png", 2),
                _buildBottomMenuItem("assets/ic_settings.png", 3),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Container(
              width: 56,
              height: 56,
              child: Icon(
                Icons.add,
                size: 32,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7366FE),
                      Color(0xFF9891E9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomMenuItem(String image, int index) {
    bool selected = index == _selectedNavButtonIndex;
    return Expanded(
      child: Column(
        children: [
          FlatButton(
            child: Image.asset(
              image,
              color: selected ? kPrimaryColor : kColorGray,
              height: 24,
            ),
            onPressed: () {
              if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ControllerPage()));
                return;
              }
              setState(() {
                _selectedNavButtonIndex = index;
              });
            },
          ),
          Visibility(
            child: _buildCircle(),
            visible: selected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
    );
  }

  static List<String> tabLabels = [
    "Living Room",
    "Drawing Room",
    "Kitchen",
    "Dining",
    "Office",
  ];

  static List<String> equipmentTitles = [
    "AC",
    "Light",
    "TV",
    "Wi-Fi",
    "Fan",
    "Sound",
  ];
  static List<String> equipmentDescriptions = [
    "Samsung EX43",
    "Philips 900",
    "Samsung RK55 4K",
    "Xiaomi 4c",
    "Philips SG021",
    "Micro lab M - 108",
  ];
  static List<String> equipmentIcons = [
    "assets/ic_air_conditioner.png",
    "assets/ic_idea.png",
    "assets/ic_monitor.png",
    "assets/ic_wifi.png",
    "assets/ic_fan.png",
    "assets/ic_sound.png",
  ];

  Widget _buildControlPage(int index) {
    final double singleCellWidth =
        (MediaQuery.of(context).size.width - 16 - 32) / 2;
    final double singleCellHeight = 156;

    return Padding(
      key: PageStorageKey(index),
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: singleCellWidth,
          childAspectRatio: singleCellWidth / singleCellHeight,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return SmartEquipmentCard(
              title: equipmentTitles[index],
              description: equipmentDescriptions[index],
              icon: equipmentIcons[index]);
        },
        itemCount: equipmentTitles.length,
      ),
    );
  }
}

class SmartEquipmentCard extends StatefulWidget {
  final String title;
  final String description;
  final String icon;
  const SmartEquipmentCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.icon,
  }) : super(key: key);

  @override
  _SmartEquipmentCardState createState() => _SmartEquipmentCardState();
}

class _SmartEquipmentCardState extends State<SmartEquipmentCard> {
  var isOn = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      shadowColor: kColorGray.withOpacity(0.2),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 16,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.icon,
                  height: 32,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Transform.scale(
                    scale: 0.6,
                    child: Transform.translate(
                      offset: Offset(18.6, -9.3),
                      child: CupertinoSwitch(
                        value: isOn,
                        onChanged: (a) {
                          setState(() {
                            isOn = a;
                          });
                        },
                        activeColor: kPrimaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
              ),
            ),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
