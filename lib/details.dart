import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget{
  final data;
  const ItemDetails({super.key, this.data});

  @override
  State<StatefulWidget> createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetails>{
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          unselectedLabelStyle: TextStyle(fontSize: 0),
          selectedItemColor: Colors.orange[800],
          currentIndex: index,
          onTap: (val) {
            setState(() {
              index = val;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '*'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: '*'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: '*'),
          ]),
      endDrawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        // centerTitle: true,
        // backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_2_outlined, color: Colors.black, size: 30,),
            Text(' Item '),
            Text('Details', style: TextStyle(color: Colors.orange[800], fontSize: 20),)
          ],
        ),
        elevation: 0,
      ),
      body: ListView(
        children:[
          // Container(
            // height: 300,
            // width: double.infinity,
            Image.asset(widget.data['image'], fit: BoxFit.cover,),
          // ),
          // Image.asset(widget.data['image']),
          Container(child: Text(widget.data['name'], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
          Container(child: Text(widget.data['description'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey), textAlign: TextAlign.center,)),
          Container(child: Text('\$${widget.data['price']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange[800]), textAlign: TextAlign.center,)),
          Container(height: 30,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Colors:',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
              Text('Red', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              ),
              Text('Blue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('Size: 34 35 40 41 42', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: Colors.grey),),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MaterialButton(onPressed: (){}, child: Text('Add to Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), textColor: Colors.white,),
          ),
        ] 
      ),
    );
  }
}