import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/api_services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Name"),
                      SizedBox(width: 20,),
                      Text(_userModel![index].username),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text("Email"),
                      SizedBox(width: 20,),
                      Text(_userModel![index].email),

                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
