import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>with SingleTickerProviderStateMixin {

 late TabController controller ;
 @override
  void initState() {
   controller = TabController(length: 3, vsync: this);
   controller.addListener(() {
     setState(() {

     });
   });
    super.initState();
  }
@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar${controller.index+1}'),
        bottom: TabBar(
          controller: controller,
          tabs: [
          Tab(text: 'One',icon: Icon(Icons.one_k_outlined),),
          Tab(text: 'Two',icon: Icon(Icons.two_k_outlined)),
          Tab(text: 'Three',icon: Icon(Icons.three_k_outlined),),
        ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller,
                children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.green,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
              ),
            ]),
          )

        ],
      ),
    );
  }
}
