
import 'package:flutter/material.dart';
import 'package:myproject/constant/textstyle.dart';
import '../homepage.dart';
import '../widgets/textfields.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Login',style: heading,)),
            SizedBox(height: 30,),
            TextFieldss(title: 'Username', hint: 'Username',),
            SizedBox(height: 30,),
            TextFieldss(title: 'Password', hint: 'Password'),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remember me'),
                Text('Forgot password')
              ],
            ),
            SizedBox(height: 40,),
            Center(
              child: SizedBox(
                width: width,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                }, child: Text('Login')),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 2,
                  width: 105,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Or Login With'),
                ),
                Container(
                  height: 2,
                  width: 105,
                  color: Colors.black,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage('assets/images/google.png'))),
                ),
                // Container(
                //   height: 50,
                //   width: 50,
                //   decoration: BoxDecoration(image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage('assets/images/fb.png'))),
                // ),
                // Container(
                //   height: 50,
                //   width: 50,
                //   decoration: BoxDecoration(image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage('assets/images/tetr.png'))),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
