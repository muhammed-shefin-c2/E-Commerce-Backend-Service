import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:commerce_js_mobile_app/Screens/Product_Grid.dart';
import 'package:commerce_js_mobile_app/offfer%20data/Offer_Data.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchcontroller;


  @override
  void initState() {
    super.initState();
    _searchcontroller = TextEditingController();
  }


  @override
  void dispose() {
    _searchcontroller.dispose();
    super.dispose();
  }

  void onSave() {
    print(_searchcontroller.text);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 47.9,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo/menu (1).png', height: 35, width: 35,),
                Image.asset("assets/logo/Rectangle 97 (1).png", height: 56, width: 56,)
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Text("Welcome,", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Color(0xFF000000), fontFamily: 'Poppins'),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Text("Our Fashions App", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Color(0xFF666666)),),
          ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 260,
              height: 50,
              child: TextField(
                  controller: _searchcontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF3F4F5),
                    label: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top:3),
                      child: Text("Search...", style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400, fontSize: 14),),
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.01),
                      borderRadius: BorderRadius.circular(90)
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 25, top: 15, bottom: 15),
                      child: Image.asset('assets/logo/icon (1).png', width: 15.62, height: 16,),
                    ),
                    //contentPadding: EdgeInsets.symmetric(vertical: 1)
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset('assets/logo/filtter (1).png', width: 50, height: 50,),
              )
            ],
          ),
        ),
          SizedBox(
            height: 35,
          ),
          CarouselSlider(items: curousal_items.map((item){
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      bottom:0,
                        left: 25,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                            item['offer'] ?? 'Default Title',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                            ),
                            Text(
                            item['detail'] ?? 'Default Title',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                            item['code'] ?? 'Default Title',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductGrid()));
                            },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF000000),
                                  foregroundColor: Color(0xFFFFFFFF),
                                  minimumSize: Size(20, 33),
                                  shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90),
                          side: BorderSide(
                            color: Colors.black,
                            width: 0.0,),
                                  ),),
                                child: Text('Get Now',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),)
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
            );
          }).toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                viewportFraction: 0.77,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                pauseAutoPlayOnTouch: true,
                initialPage: 0,

                onPageChanged: (index, reason) {
                  print('Page changed to: $index');
                },
              ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrivals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductGrid()));
                  }, child: Text('view All', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF666666)),))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GridView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 3/4.1),
                  itemCount: 2,
                  itemBuilder: (context, index){
                var prod = Homeproducts[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductGrid()));
                  },
                  child: Card(
                    elevation: 0,
                    child: Padding(padding: EdgeInsets.zero,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Padding(padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: 155,
                        height: 240,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                      child: SizedBox(
                                        width: 170,
                                          height: 170,
                                          child: Image.asset(prod['image']!, width: double.infinity, height: double.infinity, fit: BoxFit.cover,)
                                      )
                                  ),
                                Positioned(
                                  left: 133,
                                    top: 15,
                                    child: Image.asset('assets/logo/love (1).png', width: 20,height: 20,)),
                                ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(prod['title']!, style: TextStyle(color: Color(0xFF000000), fontSize: 17 ,fontWeight: FontWeight.w600),),
                            Text(prod['details']!, style: TextStyle(color: Color(0xFF666666), fontSize: 13.5 ,fontWeight: FontWeight.w400),),
                            Text(prod['price']!, style: TextStyle(color: Color(0xFF000000), fontSize: 17 ,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      ),
                    ),
                    ),
                  ),
                );
                  }),
            ),
          ),
        ],

      ),
    );
  }
}
