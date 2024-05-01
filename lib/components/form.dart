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

// Double-sided textfield
Container duoTextField(String text, String hintText, bool isPassword, TextEditingController controller){
  return Container(
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 140,
          child: Text(
            text
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            enableSuggestions: !isPassword,
            autocorrect: !isPassword,
            cursorColor: primaryColour,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
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
        ),
      ],
    )
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

// Full button
Container fullBtn(IconData icon, String text, Color colour){
  return Container(
    height: 55,
    decoration: BoxDecoration(
      border: Border.all(
        color: lightGrey,
      ),
      borderRadius: BorderRadius.circular(4)
    ),
    child: TextButton(
      onPressed: () => {}, 
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: colour
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal
                )
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.black
          )
        ],
      )
    ),
  );
}

// Logout Button
TextButton logoutBtn(){
  return TextButton(
    onPressed: () => {},
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 25)
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: lightGrey)
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