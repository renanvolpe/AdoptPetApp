import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Adote um pet"),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                child: Image.network('https://logospng.org/wp-content/uploads/nike.jpg'),
              ),
            ),
            Container(
              width: 200,
                height: 120,
              color: Colors.red,
              child: Column(
                children: const [
                  TextField(  
                      //controller: passwordController,  
                      obscureText: true,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),  
                        hintText: 'Enter Password',  
                      ),  
                    ),
                    SizedBox(height: 20,),
                    TextField(  
                      //controller: passwordController,  
                      obscureText: true,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),  
                        hintText: 'Enter Password',  
                      ),  
                    ),
                ],
              ),
            ),
            TextButton(onPressed: (){},
             child:
             const Text('LOGIN',
             style: TextStyle(
              color: Colors.orange,
             )),
             ),
             TextButton(onPressed: (){},
             child:
             const Text('Esqueci minha senha',
             style: TextStyle(
              color: Colors.black,
             ),),
             ),
             const Text('aplicativo criado pelos ALEXANDRO'),
          ],
        )
        );
  }
}
