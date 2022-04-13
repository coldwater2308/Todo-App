import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; 
  String todo=""; 
  bool _ischecked=false;
 List<Map> _todoList=[
{
  "data": "Wake Up",
  "isChecked":false
},
{
  "data": "Eat",
  "isChecked":false
},
{
  "data": "Do Programming :)",
  "isChecked":false
}
 ]; 
 List<Row> todowidget=[];
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {  



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children:  List.generate(_todoList.length, (index) => 
          
          // container containing particular todo list
              Container(
                    decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(5),  
                    border: Border.all(
                    color:  _todoList[index]["isChecked"]?Colors.green:Colors.blueAccent,
                    style: BorderStyle.solid 
            ),),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          height: 100,
          child: Padding(
               padding: EdgeInsets.all(5),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded( 
                    flex: 1,
                    child:  _todoList[index]["isChecked"]?Icon(Icons.check,color: Colors.green,) : Checkbox(value: _todoList[index]["isChecked"], onChanged: (value)=>{
                      setState((){
                          _todoList[index]["isChecked"]=!_todoList[index]["isChecked"];
                      })
                    }),
                  ),
                Expanded(
                  flex: 7,
                  child: Text(_todoList[index]["data"])),
                Expanded( 
                  flex: 2,
                  child: MaterialButton(child: Text("Delete"), color: Colors.red,textColor: Colors.white, onPressed: (){
                     setState(() {
                            _todoList.removeAt(index);
                     });
                         
                  }),
                )
              ],),
            ),
          ))
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>showDialog(
                  context: context,
                  builder: (BuildContext Context) {
                    return Column(
                      children: [
                        Expanded(
                          child: AlertDialog(
                            title: Text('Add a Todo'),
                            content: TextField(
                              onChanged: (value)=>{
                                todo=value
                              },
                            ),
                            actions: [
                              FlatButton( 
                              
                                textColor: Colors.black,
                              
                                onPressed: () {Navigator.pop(Context);},
                                child: Text('CANCEL',style: TextStyle(color: Colors.white),), 
                                
                                color: Colors.redAccent,
                              ),
                              FlatButton(
                                textColor: Colors.black, 
                                 color: Colors.blueAccent,
                                onPressed: () {
                                  setState(() {
                                    _todoList.add({
                                      "data": todo,
                                      "isChecked":false
                                    });
                                    todo="";
                                    Navigator.pop(Context);
                                  });
                                },
                                child: Text('ADD' , style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
  
                        ),
                      ],
                    );
                  },
                ),
        tooltip: 'Add a todo task',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

