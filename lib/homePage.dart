import 'package:flutter/material.dart';
import 'package:untitled1/details.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List categories = [
    {
      'icon': Icons.man_2_rounded,
      'text': 'Men'
    },
    {
      'icon': Icons.woman_outlined,
      'text': 'Women'
    },
    {
      'icon': Icons.electric_bolt,
      'text': 'Electrical'
    },
    {
      'icon': Icons.houseboat,
      'text': 'Hobbies'
    },
  ];
  final List products = [
    {
      'image': 'images/slide-1.jpg',
      'name': 'Product 1',
      'description': 'Description 1',
      'price': 100
    },
    {
      'image': 'images/slide-2.png',
      'name': 'Product 2',
      'description': 'Description 2',
      'price': 200
    },
    {
      'image': 'images/slide-3.png',
      'name': 'Product 3',
      'description': 'Description 3',
      'price': 150
    },
    {
      'image': 'images/slide-4.png',
      'name': 'Product 4',
      'description': 'Description 4',
      'price': 250
    },
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        unselectedLabelStyle: TextStyle(fontSize: 0),
        selectedItemColor: Colors.orange[800],
        currentIndex: index,
        onTap: (val){
          index = val;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '*'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '*'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: '*'),
        ]
      ),
      key: scaffoldKey,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 30,),
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                    border: InputBorder.none,
                  ),
                )),
                Padding(padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.menu,size: 40,),)
              ],
            ),
            SizedBox(height: 20,),
            Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((cat) {
                return Column(children:[
                  Container(
                    // margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:Icon(cat['icon'], size: 40,),
                  ),
                  Text(cat['text'],style: TextStyle(fontSize: 16),)
                ]);
              }).toList(),
            ),
            SizedBox(height: 20,),
            const Text(
              "Best Selling",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20,),
            GridView.builder(
              itemCount: products.length,
              physics:NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10, mainAxisExtent: 240),
              itemBuilder: (context, index) => 
              [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetails(data: products[index])));
                  },
                  child: Card(
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(products[index]['image'],height: 100, fit: BoxFit.fill),
                          Container(height: 10,),
                          Text(products[index]['name'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          Text(products[index]['description'],style: TextStyle(fontSize: 16,color: Colors.grey),),
                          Container(height: 5,),
                          Text('Price: \$${products[index]['price']}',style: TextStyle(fontSize: 16, color: Colors.orange[800]),),
                        ],
                      ),
                    ),
                  ),
                ),
              ][0],
            )
          ],
        ),
      )
    );
  }
}
