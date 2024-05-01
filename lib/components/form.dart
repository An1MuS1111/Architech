import 'package:architech/config/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
            hintText: "Enter your registered email",
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
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
RichText textLink(BuildContext context, String firstText, String secondText, Function onTap){
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black
      ),
      recognizer: TapGestureRecognizer()
      ..onTap = (){
        onTap();
      },
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