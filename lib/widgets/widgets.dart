import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration textFormFields(String hintText){
  return InputDecoration(
      hintText: hintText, hintStyle: GoogleFonts.montserrat(color:Colors.black54),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color:Colors.blueAccent),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      )
  );
}
TextStyle textStyling(){
  return  GoogleFonts.montserrat(
    color:Colors.black, fontWeight: FontWeight.w300, fontSize: 15,
  );
}
