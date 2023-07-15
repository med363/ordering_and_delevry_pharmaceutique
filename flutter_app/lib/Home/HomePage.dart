import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //to be text an the begining
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5,left: 10,right:10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () { 
                },
               icon: 
                Image.asset('../../icons/menu.png')
                ),
                Row(
                  children: [
             TextButton(
                onPressed: () { 
                },
               child: 
                const Text(
                  "Log in",
                  style: TextStyle(color: Colors.black),
                ),
             ),
             Icon(
              Icons.person
             )
                  ],
                )
 

            ],
          ),
          //start text
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right:10),
          child: Column(
            children: [
          Text(
            "What you search?",
            style: GoogleFonts.oswald(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold
              ),
            ),
            ],
          ),
          ),

          SizedBox(
            height: 50,
          
            child: ListView(
              //scroll horizontall
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 30,left: 10),
              
            //box
            children: [
              Container(
                height: 500,
                width: 100,
        
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
              //  child: IconButton(onPressed: (){},
              //  icon: Image.asset("../icons/med.png"),),

              ),
               Container(
                height: 500,
                width: 100,

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16)
                ),
              //  child: IconButton(onPressed: (){},
              //  icon: Image.asset("../icons/med.png"),),

              ),
               Container(
                height: 500,
                width: 100,

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16)
                ),
              //  child: IconButton(onPressed: (){},
              //  icon: Image.asset("../icons/med.png"),),

              ),
              Container(
                                height: 500,
                width: 100,

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                
                ),
              //  child: IconButton(onPressed: (){},
              //  icon: Image.asset("../icons/med.png"),),

              ),
               Container(
                height: 500,
                width: 100,

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16)
                ),
              //  child: IconButton(onPressed: (){},
              //  icon: Image.asset("../icons/med.png"),),

              )
            ],
              ),
          )
        ],
      ),
    );
  }
}
