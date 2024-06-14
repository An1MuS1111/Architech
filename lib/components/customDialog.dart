import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget{
  CustomDialog(this.icon, this.text, this.actionText, this.actionFunction);

  final IconData icon;
  final String text;
  final String actionText;
  final Function actionFunction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 290,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -25,
              left: 110,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Icon(
                  icon,
                  size: 70,
                  color: semanticRed
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 260,
                    height: 60,
                    margin: EdgeInsets.only(top: 60),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: actionFunction(),
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red.shade200
                        ),
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.red[100]
                      ),
                      child: Text(
                        actionText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[700]
                      ),
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white
                        ),
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