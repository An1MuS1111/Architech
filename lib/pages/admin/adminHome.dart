import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/admin/adminReport.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget{
  AdminHome({Key? key, required this.tab}) : super(key: key);
  
  final int tab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminHomeTopBar(context),
      // bottomNavigationBar: adminBottomBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: secondaryColour,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, User",
                  style: TextStyle(
                    fontSize: mainTitle
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Total sales this month",
                  style: TextStyle(
                    fontSize: subTitle
                  ),
                ),
                Text(
                  "RM813.50",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                    color: primaryColour
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TOTAL PROFIT",
                      style: TextStyle(
                        fontSize: subTitle
                      ),
                    ),
                    Text(
                      "+45.1%",
                      style: TextStyle(
                        fontSize: 50,
                        letterSpacing: -3,
                      ),
                    )
                  ]
                ),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: lightGrey,
                        width: 1
                      )
                    )
                  ),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 70
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TOTAL NEW USERS",
                      style: TextStyle(
                        fontSize: subTitle
                      ),
                    ),
                    Text(
                      "+102",
                      style: TextStyle(
                        fontSize: 50,
                        letterSpacing: -3
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => AdminReport())
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Report",
                    style: TextStyle(
                      fontSize: subTitle,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}