import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminReport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Report", 110),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 110,
              right: 130,
              child: SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text(
                      "Total Orders",
                      style: TextStyle(
                        fontSize: subTitle
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "4000",
                      style: TextStyle(
                        fontSize: 50,
                        letterSpacing: -3
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 100,
                          title: "OPC",
                          showTitle: true,
                          radius: 30,
                          color: semanticBlue,
                          badgePositionPercentageOffset: 1,
                        ),
                        PieChartSectionData(
                          value: 210,
                          title: "CPP",
                          showTitle: true,
                          radius: 30,
                          color: semanticGreen
                        ),
                        PieChartSectionData(
                          value: 60,
                          title: "ASN",
                          showTitle: true,
                          radius: 30,
                          color: semanticYellow
                        )
                      ]
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Date",
                    style: TextStyle(
                      fontSize: subTitle,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        // color: lightGrey,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Text("Username"),
                                SizedBox(width: 10),
                                Text("Username"),
                              ],
                            )
                          ),
                          
                          Text("RM6")
                        ],
                      )
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => 
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}