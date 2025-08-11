import 'package:coursezego/main.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'callservices.dart';
import 'loing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Callservices callservices = Callservices();
  @override
  void initState() {
    callservices.onUserLogin(sharedPreferences.getString("id")!,
        sharedPreferences.getString("username")!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Container(child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.lock, size: 80, color: Colors.blue[700]),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: "ID",
                    prefixIcon: const Icon(Icons.perm_identity),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

              ],
            ),
          ),
          Card(child:Column(children: [
            Text("Username: ${sharedPreferences.getString("username")!}"),
            Text("ID: ${sharedPreferences.getString("id")!}"),
          ],),),
          const SizedBox(height: 25),

            MaterialButton(onPressed:() {
              setState(() {
              });
            },child: const Text("refresh")),
            ZegoSendCallInvitationButton(
              isVideoCall: false,
              resourceID: "eslamZagoApp",
              invitees: [
                ZegoUIKitUser(
                  id: _idController.text,
                  name: _usernameController.text,
                ),
              ],
            ),

          const SizedBox(height: 25),

          IconButton(onPressed: (){
            sharedPreferences.clear();
            callservices.onUserLogout();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => const LoginPage()), (route) => false);
            },
              icon: Icon(Icons.logout, size: 80, color: Colors.red)),

        ],
      ),),
    );
  }
}
