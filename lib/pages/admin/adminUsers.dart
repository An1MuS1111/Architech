import 'package:architech/components/customDialog.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminUsers extends StatefulWidget{
  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  final List<int> colorCodes = <int>[300, 200, 100];
  final List<String> userMenu = ["Edit, Delete"];
  late final String selectedAction;

  TextEditingController searchController = TextEditingController();

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: topBar(context),
        bottomNavigationBar: adminBottomBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Users",
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
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
                    onChanged: (value){
                      setState(() {
                        // userListOnSearch = userList.where((element) => element.contains(value)).toList();
                      });
                    },
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: 10,
                  // itemCount: searchController!.text.isNotEmpty ? userListOnSearch.length : userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(index < 10){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber[colorCodes[index % colorCodes.length]],
                          // color: label[index % label.length],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: secondaryColour,
                              child: Padding(
                                padding: const EdgeInsets.all(2), // Border radius
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.grey,
                                  )
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "User Name",
                                      // searchController!.text.isNotEmpty ? userListOnSearch[index] : userList[index],
                                      style: TextStyle(
                                        fontSize: subTitle,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    Text(
                                      "useremail@gmail.com",
                                      // searchController!.text.isNotEmpty ? userListOnSearch[index] : userList[index],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuButton(
                              color: Colors.black,
                              icon: Icon(Icons.more_vert_rounded), 
                              itemBuilder: (BuildContext context){ 
                                return [
                                  PopupMenuItem(
                                    height: 35,
                                    onTap: (){},
                                    child: Text(
                                      "Edit", 
                                      style: TextStyle(color: Colors.white)
                                    )
                                  ),
                                  PopupMenuItem(
                                    height: 35,
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context){
                                          return CustomDialog(Icons.warning_rounded, "Are you sure you want to delete this user?", "Delete", (){});
                                        }
                                      );
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white)
                                    )
                                  )
                                ];
                              },
                            )
                            // InkWell(
                            //   onTap: (){
                                
                            //   },
                            //   child: Icon(
                            //     Icons.more_vert_rounded
                            //   ),
                            // )
                          ],
                        )
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
      ),
    );
  }
}