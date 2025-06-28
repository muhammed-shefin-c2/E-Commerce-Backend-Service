import 'package:commerce_js_mobile_app/domain/bloc/API/Api_Bloc.dart';
import 'package:commerce_js_mobile_app/domain/bloc/API/Api_Event.dart';
import 'package:commerce_js_mobile_app/domain/bloc/API/Api_State.dart';
import 'package:flutter/material.dart';
import 'package:commerce_js_mobile_app/Models/Product_Models.dart';
import 'package:commerce_js_mobile_app/Tab_Screen.dart';
import 'package:commerce_js_mobile_app/repository/Product_Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(ProductRepository())..add(ApiFetchingEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TabScreen()));
                  }, icon: Icon(Icons.backspace_rounded, color: Color(0xFF000000), size: 25,)),
                  Image.asset('assets/logo/icon (1).png', width: 20, height: 20,),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text('Clothes', style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF000000),fontSize: 22),),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 25, left: 20),
              child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
                if (state is ApiFetching) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ApiFetched) {
                  return GridView.builder(
                shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
                  padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                childAspectRatio: 3/4.2,
                ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                  var prod = state.products[index];
                  return Card(
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
                                                child: Image.network(prod.image, width: 150, height: 150,)
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8, left: 8),
                                    child: Text(prod.title, style: TextStyle(color: Color(0xFF000000), fontSize: 17 ,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                    child: Text(prod.description, style: TextStyle(color: Color(0xFF666666), fontSize: 13.5 ,fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis,),maxLines: 1,),
                                  ),
                                  Text('\$${prod.price.toString()}', style: TextStyle(color: Color(0xFF000000), fontSize: 17 ,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            ),
                          ),
                          ),
                        );
                  },
                  );
                } else if (state is ApiErorr) {
                  return Center(child: Text(state.message, style: TextStyle(color: Colors.red, fontSize: 16),),);
                } else {
                  return const Center(child: Text("No data available"),);
                }
              })
            )
                ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
      print("dispose");
  }
}
