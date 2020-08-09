import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ControllerPage extends StatefulWidget {
  ControllerPage({Key key}) : super(key: key);

  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedNavButtonIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: equipmentTitles.length, vsync: this);
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
                      child: Icon(Icons.arrow_back_ios, color: kColorGray),
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: kColorGray,
                    size: 30,
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
                      "Living Room",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
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
                  tabs: List.generate(equipmentTitles.length, (index) {
                    return Tab(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          left: 16,
                          right: 16,
                        ),
                        child: Text(equipmentTitles[index]),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(equipmentTitles.length, (index) {
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
    return SingleChildScrollView(
      child: Container(
        key: PageStorageKey(index),
        color: Color(0xFFF7F7F7),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 250,
              width: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: _buildController(),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFEAEBF2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 31,
                    width: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40, left: 60, right: 60),
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(0, 5),
                      blurRadius: 40,
                    )
                  ]),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: "Edit Device Name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Color(0xFFF6F6F6),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildController() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFD9E1EC),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: Offset(0, 16),
                  blurRadius: 20,
                )
              ]),
        ),
        _buildRods(270),
        _buildSlider(),
        Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFFF6EDED),
                Color(0xFFFFFFFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(5, 5),
                blurRadius: 16,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFFF6EDED),
                Color(0xFFFFFFFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(5, 5),
                blurRadius: 16,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(36),
          alignment: Alignment.center,
          child: Text(
            "25.0° C",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRods(int angleLim) {
    int count = (angleLim / 4).ceil();
    return Stack(
      children: List.generate(count, (index) {
        return Align(
          alignment: Alignment.topCenter,
          child: Transform.rotate(
            angle: pi / 360 * (index * 8),
            origin: Offset(0, 62.5),
            child: Container(
              height: 125,
              width: 3,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFF6395FE).withOpacity(0.7),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSlider() {
    return GestureDetector(
      onTap: () {
        print("tabpped");
      },
      onVerticalDragUpdate: (details) {
        print("onVerticalDragUpdate");
        print(details.delta.dy);
      },
      onHorizontalDragUpdate: (details) {
        print("onHorizontalDragUpdate");
        print(details.delta.dx);
      },
      child: CustomPaint(
        size: Size(250, 250),
        painter: CirclularSlider(45),
      ),
    );
  }
}

class CirclularSlider extends CustomPainter {
  final angle;
  Path path;
  CirclularSlider(this.angle);
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Color(0xFF6395FE)
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi / 180 * angle,
      false,
      paint,
    );

    final handlerCenter = center +
        Offset.fromDirection(
          -pi / 2 + pi / 180 * angle,
          radius,
        );
    final handlerRadius = 10.0;

    Paint handlerPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [
          Color(0xFF7366FE),
          Color(0xFF9891E9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(
        center: handlerCenter,
        radius: handlerRadius,
      ));

    canvas.drawCircle(handlerCenter, handlerRadius, handlerPaint);

    path = new Path()
      ..addOval(Rect.fromCircle(center: handlerCenter, radius: handlerRadius))
      ..close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (CustomPainter is CirclularSlider) {
      return this.angle != (oldDelegate as CirclularSlider).angle;
    } else {
      return true;
    }
  }

  @override
  bool hitTest(Offset position) {
    if (path == null) return false;
    return path.contains(position);
  }
}
