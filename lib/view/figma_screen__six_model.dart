import 'package:flutter/material.dart';
import 'package:todo_new_app/data/app_data.dart';
import 'package:todo_new_app/res/common/app_menu_container.dart';
import 'package:todo_new_app/res/constant/string.dart';
import '../res/constant/image.dart';

class FigmaScreenSixModel extends StatefulWidget {
  const FigmaScreenSixModel({Key? key}) : super(key: key);

  @override
  State<FigmaScreenSixModel> createState() => _FigmaScreenSixModelState();
}

class _FigmaScreenSixModelState extends State<FigmaScreenSixModel> {
  int index = 0;
  List<Widget> screens = [
    Container(color: Colors.white),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
    Container(color: Colors.teal),
  ];

  List<String> items = [
    "1",
    "2",
    "3",
    "4",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.flield,
                  hintStyle: const TextStyle(
                    color: Color(0xFFB8B8B8),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: const Color(0xFFAB0B3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.grey,
                isScrollable: false,
                labelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 16,
                ),
                tabs: [
                  const Tab(
                    text: AppStrings.week,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Container(
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                    child: const Tab(
                      text: AppStrings.month,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Container(color: Colors.cyanAccent),
                          ));
                    },
                    child: const Tab(
                      text: AppStrings.year,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Row(
                children: [
                  const Text(
                    AppStrings.best,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 28,
                        fontFamily: "Staatliches-Regular"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 32,
                    width: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage(ModelImage.ege),
                          ),
                          const Text(
                            AppStrings.white,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton<String>(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items
                                .map((String items) => DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              debugPrint("newValue  --> $newValue");
                              setState(() {});
                            },
                            underline: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemCount: menuList.length,
                    itemBuilder: (context, index) => AppMenuContainer(
                          image: menuList[index].image,
                          text: menuList[index].text,
                          texttwo: menuList[index].texttwo,
                          textthree: menuList[index].textthree,
                          imagetwo: menuList[index].imagetwo,
                        ))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFFAB0B3A),
          unselectedItemColor: Colors.black,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: "star",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.g_mobiledata_outlined),
              label: "mobile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "person",
            ),
          ],
        ),
      ),
    );
  }
}
