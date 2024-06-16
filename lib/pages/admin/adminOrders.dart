import 'package:architech/components/customDialog.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminOrders extends StatefulWidget{
  AdminOrders({Key? key, required this.tab}) : super(key: key);
  
  final int tab;

  @override
  State<AdminOrders> createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  final List<int> colorCodes = <int>[300, 200, 100];
  final List<String> userMenu = ["Edit, Delete"];
  late final String selectedAction;

  TextEditingController searchController = TextEditingController();

  Future refresh() async{

  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    searchController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: topBar(context),
      // bottomNavigationBar: adminBottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Active Orders",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: lightGrey
                      )
                    ),
                    errorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    hintText: "Search"
                  ),
                  // onChanged: (value){
                  //   setState(() {
                  //     // userListOnSearch = userList.where((element) => element.contains(value)).toList();
                  //   });
                  // },
                ),
              ),
              ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  if(index < 5){
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        // color: label[index % label.length],
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        size: 16,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "June 12, 10:00AM",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: semanticBlue,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "In progress",
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order #012909",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Text(
                                  "RM6.00",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Row(children: [
                            Text("Parcels")
                          ]),
                          Text("Parcel 1"),
                          Text("Parcel 2"),
                          Row(
                            children: [
                              Expanded(child: SizedBox()),
                              CircleAvatar(
                                radius: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(2), // Border radius
                                  child: ClipOval(
                                    child: Container(
                                      color: Colors.grey,
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text("Wan Nurnabihah")
                            ],
                          ),
                        ],
                      ),
                    );
                  } else{
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              ),
            ]
          )
        )
      )
    );
  }
}