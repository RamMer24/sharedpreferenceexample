import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Loginpageexample extends StatefulWidget {
  const Loginpageexample({Key? key}) : super(key: key);

  @override
  State<Loginpageexample> createState() => _LoginpageexampleState();
}

class _LoginpageexampleState extends State<Loginpageexample> {

  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Center(child: Text("Loginpageexample",style: TextStyle(fontSize: 30),)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              SizedBox(
                height: 15,
              ),
              Text(
                "SharedPref example",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(

                        fillColor: Color(0xff6C6C6C),
                        hintText: "Text",hintStyle: TextStyle(color: Colors.white,),
                        labelStyle:  TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,color: Color(0xffFE7551),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),

              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFE7551),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10,),
                    ),
                  ),
                  onPressed: () async {

                    var nm = _name.text.toString();
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    //Store
                    prefs.setString("firstname", nm);
                    prefs.setInt("age", 25);

                    Fluttertoast.showToast(msg: "Value Stored!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.black87,
                        fontSize: 15);

                    _name.text = "";






                  },
                  child: Text("Add",style: TextStyle(fontSize: 25.0),),),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFE7551),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10,),
                    ),
                  ),
                  onPressed: () async{

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    //Check
                    if(prefs.containsKey("firstname"))
                      {
                        var firstname = prefs.getString("firstname").toString();
                        var age = prefs.getInt("age").toString();
                        Fluttertoast.showToast(msg: "Value : "+firstname,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            fontSize: 15);
                      }
                    else
                      {
                        Fluttertoast.showToast(msg: "Value Not Available!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            fontSize: 15);
                      }

                  },
                  child: Text("Read",style: TextStyle(fontSize: 25.0),),),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFE7551),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10,),
                    ),
                  ),
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    //Check
                    if(prefs.containsKey("firstname"))
                    {
                      prefs.clear();
                      //prefs.remove("firstname");

                      Fluttertoast.showToast(msg: "Value Deleted!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black87,
                          fontSize: 15);
                    }
                    else
                    {
                      Fluttertoast.showToast(msg: "Value Not Available!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black87,
                          fontSize: 15);
                    }
                  },
                  child: Text("Delete",style: TextStyle(fontSize: 25.0),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
