import 'package:flutter/material.dart';

class EcoFriendlyItems extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _EcoFriendlyItems();
  }
}

class _EcoFriendlyItems extends State<EcoFriendlyItems>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Container(
            child: Image.network(
              'https://i.ibb.co/YjZt4gM/4.png', // Replace with your image URL
              width: 410, // Set the width of the image
              height: 500, // Set the height of the image
              fit: BoxFit.cover, // Adjust the BoxFit property as needed
            ),
          ),
          // Other widgets can be added here
        ],
      ),
    );
  }
}


//https://i.ibb.co/CwFD00X/3.png