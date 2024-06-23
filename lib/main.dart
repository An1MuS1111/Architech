import 'package:architech/components/bottomNavBar.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/components/processStatus.dart';
import 'package:architech/config/constants.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/controllers/providers/orderConfimProvider.dart';
import 'package:architech/controllers/providers/orderCriteriaProvider.dart';
import 'package:architech/controllers/providers/orderPlaceProvider.dart';
import 'package:architech/controllers/providers/orderProvider.dart';
import 'package:architech/controllers/providers/orderScheduleProvider.dart';
import 'package:architech/models/bottomNavBarModel.dart';
import 'package:architech/pages/admin/adminHome.dart';
import 'package:architech/pages/admin/adminOrders.dart';
import 'package:architech/pages/admin/adminProfile.dart';
import 'package:architech/pages/admin/adminReport.dart';
import 'package:architech/pages/admin/adminUsers.dart';
import 'package:architech/pages/login.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/order/orderConfirm.dart';
import 'package:architech/pages/order/orderCriteria.dart';
import 'package:architech/pages/order/orderDetails.dart';
import 'package:architech/pages/order/orderEdit.dart';
import 'package:architech/pages/order/orderPayment.dart';
import 'package:architech/pages/order/orderSchedule.dart';
import 'package:architech/pages/order/orderTracking.dart';
import 'package:architech/pages/orders.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/signup.dart';
import 'package:architech/pages/support.dart';
import 'package:architech/pages/support/helpCentre.dart';
import 'package:flutter/material.dart';

// import 'package:architech/config/router.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:architech/api/firebase_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  await FirebaseApi().initNotifications();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FormValidator()),
    ChangeNotifierProvider(create: (context) => OrderPlaceProvider()),
    ChangeNotifierProvider(create: (context) => OrderCriteriaProvider()),
    ChangeNotifierProvider(create: (context) => OrderScheduleProvider()),
    ChangeNotifierProvider(create: (context) => OrderConfirmProvider()),
  ], child: const MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedTab = 0;
  List<BottomNavBarModel> userPages = [];
  List<BottomNavBarModel> adminPages = [];

  void initState(){
    super.initState();
    userPages = [
      BottomNavBarModel(navKey: homeNavKey, page: Home(tab: 1,)),
      BottomNavBarModel(navKey: orderNavKey, page: Orders(tab: 2)),
      BottomNavBarModel(navKey: supportNavKey, page: Support(tab: 3)),
      BottomNavBarModel(navKey: settingsNavKey, page: Profile(tab: 4))
    ];

    adminPages = [
      BottomNavBarModel(navKey: homeNavKey, page: AdminHome(tab: 1)),
      BottomNavBarModel(navKey: orderNavKey, page: AdminOrders(tab: 2)),
      BottomNavBarModel(navKey: supportNavKey, page: AdminUsers(tab: 3)),
      BottomNavBarModel(navKey: settingsNavKey, page: AdminProfile(tab: 4))
    ];
  }
  
  // TODO: Set up validation to show bottomNav for admin based on auth
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniDash',
      home: Scaffold(
        bottomNavigationBar: BottomNavBar(
          pageIndex: selectedTab,
          onTap: (index){
            if(index == selectedTab){
              userPages[index].navKey.currentState?.popUntil((route) => route.isFirst);
              // adminPages[index].navKey.currentState?.popUntil((route) => route.isFirst);
      
            } else{
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
        body: IndexedStack(
          index: selectedTab,
          children: 
            userPages.map((page) => Navigator(
              key: page.navKey,
              onGenerateInitialRoutes: (navigator, initialRoute){
                return [
                  MaterialPageRoute(builder: (context) => page.page)
                ];
              },
            )).toList()
            // adminPages.map((page) => Navigator(
            //   key: page.navKey,
            //   onGenerateInitialRoutes: (navigator, initialRoute){
            //     return [
            //       MaterialPageRoute(builder: (context) => page.page)
            //     ];
            //   },
            // )).toList()
        ),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'UniDash',
    //   // home: OrderPlace(),
    //   home: MainPage()
    // );
  }
}

// TODO: Check auth based on role and display corresponding pages
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedTab = 0;
  List<BottomNavBarModel> userPages = [];
  List<BottomNavBarModel> adminPages = [];

  void initState(){
    super.initState();
    userPages = [
      BottomNavBarModel(navKey: homeNavKey, page: Home(tab: 1,)),
      BottomNavBarModel(navKey: orderNavKey, page: Orders(tab: 2)),
      BottomNavBarModel(navKey: supportNavKey, page: Support(tab: 3)),
      BottomNavBarModel(navKey: settingsNavKey, page: Profile(tab: 4))
    ];

    adminPages = [
      BottomNavBarModel(navKey: homeNavKey, page: AdminHome(tab: 1)),
      BottomNavBarModel(navKey: orderNavKey, page: AdminOrders(tab: 2)),
      BottomNavBarModel(navKey: supportNavKey, page: AdminUsers(tab: 3)),
      BottomNavBarModel(navKey: settingsNavKey, page: AdminProfile(tab: 4))
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went Wrong'));
        } else if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'UniDash',
            home: Scaffold(
              bottomNavigationBar: BottomNavBar(
                pageIndex: selectedTab,
                onTap: (index){
                  if(index == selectedTab){
                    userPages[index].navKey.currentState?.popUntil((route) => route.isFirst);
                    // adminPages[index].navKey.currentState?.popUntil((route) => route.isFirst);
            
                  } else{
                    setState(() {
                      selectedTab = index;
                    });
                  }
                },
              ),
              body: IndexedStack(
                index: selectedTab,
                children: 
                  userPages.map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute){
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  )).toList()
                  // adminPages.map((page) => Navigator(
                  //   key: page.navKey,
                  //   onGenerateInitialRoutes: (navigator, initialRoute){
                  //     return [
                  //       MaterialPageRoute(builder: (context) => page.page)
                  //     ];
                  //   },
                  // )).toList()
              ),
            ),
          );
        } else {
          return const Login();
        }
      }
    ),
  );
}
