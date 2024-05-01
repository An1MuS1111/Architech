import 'package:architech/config/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Textfields
Container textField(String text, String hintText, bool isPassword, TextEditingController controller){
  return Container(
    alignment: Alignment.bottomLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              text,
              style: TextStyle(
                fontSize: regular,
                color: Colors.black,
              ),
            ),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          enableSuggestions: !isPassword,
          autocorrect: !isPassword,
          cursorColor: primaryColour,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            suffixIcon: isPassword ? const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
                size: 24
              ),
            ) : null,
            isDense: true, 
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                style: BorderStyle.solid
              ),
              borderRadius: BorderRadius.circular(4)
            )
          ),
          keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
        ),
      ]
    ),
  );
}

// Clickable texts
Container textLink(BuildContext context, String firstText, String secondText, Color colour){
  return Container(
    margin: const EdgeInsets.only(top: 15),
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          color: colour
        ),
        children: <TextSpan>[
          TextSpan(
            text: firstText
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: primaryColour
            )
          )
        ]
      )
    ),
  );
}

// Buttons
Container mainBtn(BuildContext context, String text, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50)
    ),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColour),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        )
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    ),
  );
}

// Logout Button
ElevatedButton logoutBtn(){
  return ElevatedButton(
    onPressed: () => {},
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 25)
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: greyColour)
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "Log out",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal
          ),
        ),
        const SizedBox(width: 110),
        Icon(
          Icons.logout_outlined,
          size: 24,
          color: greyColour
        )
      ]
    ),
  );
}