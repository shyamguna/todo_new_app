import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_new_app/model/to_do_modal.dart';
import 'package:todo_new_app/res/common/button.dart';
import 'package:todo_new_app/res/constant/app_strings.dart';
import 'package:todo_new_app/res/constant/colors.dart';
import 'to_do_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> toDoList = [];
  SharedPreferences? prefs;
  setInstant() async {
    prefs = await SharedPreferences.getInstance();
    getData();
  }

  setData() {
    List<String> data = [];

    for (int i = 0; i < toDoList.length; i++) {
      data.add(jsonEncode(toDoList[i].toJson()));
    }
    prefs!.setStringList('key', data);
  }

  getData() {
    List<String> data = [];
    data = prefs!.getStringList('key')!;

    for (int i = 0; i < data.length; i++) {
      toDoList.add(ToDoModel.fromJson(jsonDecode(data[i])));
    }
    debugPrint(toDoList.toString());
    setState(() {});
  }

  @override
  void initState() {
    setInstant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            AppStings.homeScreen,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: toDoList.isEmpty
          ? const Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: toDoList.length,
              itemBuilder: (context, index) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title: ${toDoList[index].title}",
                          style: const TextStyle(
                              color: AppColors.Colortext,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "description:${toDoList[index].des!}",
                          style: const TextStyle(
                              color: AppColors.Colortext,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "date:${toDoList[index].date!}",
                          style: const TextStyle(
                              color: AppColors.textHintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Time:${toDoList[index].time!}",
                          style: const TextStyle(
                              color: AppColors.textHintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                dynamic data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddToDoScreen(
                                      toDoList: toDoList,
                                      index: index,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  debugPrint("Data--->$data");
                                  toDoList = data;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                toDoList.removeAt(index);
                                setData();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddToDoScreen(
                toDoList: toDoList,
              ),
            ),
          );

          if (data != null) {
            debugPrint("Data ---> $data");
            toDoList = data;
            setState(() {});
          }
        },
        child: const AppButton(
          title: AppStings.addToDo,
        ),
      ),
    );
  }
}
