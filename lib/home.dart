import 'package:android_app/page_project/view_widget/howtouse.dart';
import 'package:android_app/page_project/view_widget/product_information.dart';
import 'package:android_app/page_project/view_widget/urgent.dart';
import 'package:android_app/page_project/view_widget/widget_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        // ignore: unnecessary_const
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      // ignore: sort_child_properties_last
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 82, 82, 80),
          title: const Text('KHOA HỌC KỸ THUÂT - 2023'),
          centerTitle: true,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 400.0, // Điều chỉnh kích thước chiều rộng theo ý muốn
                  height: 200.0, // Điều chỉnh kích thước chiều cao theo ý muốn
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                    left: 24,
                  ),
                  // decoration: const BoxDecoration(
                  //   // borderRadius: BorderRadius.all(Radius.circular(30)),
                  //   // shape: BoxShape.circle, (Loại bỏ dòng này để hiển thị hình chữ nhật)
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/smarthome.jpg"), // Đường dẫn đến tệp ảnh asset của bạn
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.asset(
                  //   'smarthome.jpg',
                  //   fit: BoxFit
                  //       .cover, // Để ảnh nằm vừa trong hình chữ nhật và không bị căn chỉnh hoặc cắt bớt
                  // ),
                ),
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  // iconColor: const Color.fromARGB(255, 90, 75, 74),
                  // subtitle: const Text('Dashboard'),
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(
                        // color: Color.fromARGB(255, 27, 8, 7),
                        ),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StateHouse(),
                      )),
                ),

                ListTile(
                  leading: const Icon(Icons.favorite),
                  // iconColor: const Color.fromARGB(255, 90, 75, 74),
                  // subtitle: const Text('Dashboard'),
                  title: const Text(
                    'Urgent',
                    style: TextStyle(
                        // color: Color.fromARGB(255, 27, 8, 7),
                        ),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Urgent(),
                      )),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Urgent(),
                      )),
                  leading: const Icon(Icons.settings),
                  title: const Text('How To Use'),
                ),
                const Spacer(),
                // DefaultTextStyle(
                //   style: const TextStyle(
                //     fontSize: 12,
                //     color: Colors.white54,
                //   ),
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(
                //       vertical: 16.0,
                //     ),
                //     child: const Text('Science'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
