import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderCriteria extends StatefulWidget{
  const OrderCriteria({super.key});

  @override
  State<OrderCriteria> createState() => _OrderCriteria();
}

class _OrderCriteria extends State<OrderCriteria>{
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Pick your parcel criteria", 35),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: SizedBox(
          child: mainBtn(context, "Proceed", false, (){})
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Parcel MY1234567890",
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 500,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 50,
                    left: -20,
                    child: InkWell(
                      onTap: (){},
                      radius: 20,
                      child: Container(
                        width: 120,
                        height: 125,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4-7kg",
                              style: TextStyle(
                                fontSize: 24
                              ),
                            ),
                            Text(
                              "Heavy"
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: -10,
                    child: InkWell(
                      onTap: (){},
                      radius: 20,
                      child: Container(
                        width: 110,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "2-3kg",
                              style: TextStyle(
                                fontSize: 24
                              ),
                            ),
                            Text(
                              "Medium"
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: -50,
                    child: InkWell(
                      onTap: (){},
                      radius: 20,
                      child: Container(
                        width: 140,
                        height: 155,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "8kg+",
                              style: TextStyle(
                                fontSize: 24
                              ),
                            ),
                            Text(
                              "Extra heavy"
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    right: -50,
                    child: InkWell(
                      onTap: (){},
                      radius: 20,
                      child: Container(
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No Centre Receipt",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 120,
                    right: -45,
                    child: InkWell(
                      onTap: (){},
                      radius: 20,
                      child: Container(
                        width: 130,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Fragile",
                              style: TextStyle(
                                fontSize: 24
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: -30,
                    child: InkWell(
                      onTap: (){},
                      radius: 20,
                      child: Container(
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Has Centre Receipt",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}