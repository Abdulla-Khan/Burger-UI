import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List img = [
    'assets/burger.jpg',
    'assets/dessert.jpg',
    'assets/fries.jpg',
    'assets/ice_cream.jpg',
    'assets/meat.jpg'
  ];
  List name = [
    'Burger',
    'Dessert',
    'Fries',
    'Icre Cream',
    'Meat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.15)),
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Search'),
                  trailing: Icon(Icons.filter_alt),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Ingredients',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Container(
                height: 140,
                width: double.infinity,
                child: ListView.builder(
                    // padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return Category_Card(
                        img: img,
                        name: name,
                        index: index,
                      );
                    }),
              )
            ],
          )),
    );
  }
}

class Category_Card extends StatefulWidget {
  Category_Card({
    Key? key,
    required this.index,
    required this.img,
    required this.name,
  }) : super(key: key);
  final int index;
  final List img;
  final List name;

  @override
  State<Category_Card> createState() => _Category_CardState();
}

class _Category_CardState extends State<Category_Card> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = widget.index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: widget.index == selected
              ? Color.fromRGBO(35, 45, 62, 1)
              : Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('${widget.img[widget.index]}')),
            Spacer(),
            Text(
              widget.name[widget.index],
              style: TextStyle(
                  color: widget.index == selected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
