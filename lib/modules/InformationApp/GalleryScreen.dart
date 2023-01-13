import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('الصور'),
        centerTitle: true,
      ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 4,

        ),
        children: [
          Image.asset('assets/images/g1.jpg'),
          Image.asset('assets/images/g2.jpg'),
          Image.asset('assets/images/g3.jpg'),
          Image.asset('assets/images/g4.jpg'),
          Image.asset('assets/images/g5.jpg'),
          Image.asset('assets/images/g6.jpg'),
          Image.asset('assets/images/g7.jpg'),
          Image.asset('assets/images/g8.jpg'),
          Image.asset('assets/images/g9.jpg'),
          Image.asset('assets/images/g10.jpg'),
          Image.asset('assets/images/g11.jpg'),
          Image.asset('assets/images/g12.jpg'),
          Image.asset('assets/images/g13.jpg'),
          Image.asset('assets/images/g14.jpg'),
          Image.asset('assets/images/g15.jpg'),
          Image.asset('assets/images/g16.jpg'),
        ],

      ),
    );
  }
}
