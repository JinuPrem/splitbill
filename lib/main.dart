import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final TextEditingController _amountController=TextEditingController();
final TextEditingController _peopleController=TextEditingController();
double _result=0;
class _MyAppState extends State<MyApp> {

  void SplitBill(){

    setState(() {
      double amount=double.parse(_amountController.text);
      double people=double.parse(_peopleController.text);
      double bill=amount/people;
      _result=bill;

    });

  }
  void set(){
    setState(() {
      _amountController.text="";
      _peopleController.text="";
      _result=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Split Bill",
            style: TextStyle(fontSize: 35),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // width: 100,
                  // height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("images/splitbill.jpeg"),
                        radius: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _amountController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "Amount"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _peopleController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "People"),
                        ),
                      ),
                      Container(
                          width: 220,
                          child: ElevatedButton(
                              onPressed: () {
                                SplitBill();
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: Text("GET AMOUNT"))),
                      Container(
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                set();
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: Text("RESET"))),
                      Expanded(child: Text("${_result.toStringAsFixed(2)}"))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
