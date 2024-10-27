import 'package:fakestore/app/global/buttons.dart';
import 'package:fakestore/app/routes/app_routes.dart';
import 'package:fakestore/app/utils/styles.dart';
import 'package:fakestore/app/views/cartPage/controller/cart_controller.dart';
import 'package:fakestore/app/views/homePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        automaticallyImplyLeading: false,
        title: Text(
          "Products",
          style: style(20, FontWeight.w700, Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(()   {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                var product = controller.products[index];
                
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: width,
                  height: height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.network(controller.products[index].image.toString(),
                        height: height*0.2,
                        width: width*0.3,),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: width*0.04,right: width*0.04),
                        child: Text(controller.products[index].title.toString(),
                        style: style(14, FontWeight.w600, Colors.black),),
                      ),
                      SizedBox(
                        height: height*0.01,
                      ),
                      OutlineButton(text: "Add to cart", fontsize: 14,
                          onPressed: (){
                   controller.addToCart(

                       productId: controller.products[index].id!.toInt(),
                       name: controller.products[index].title.toString(),
                       price: controller.products[index].price!.toDouble(),
                       quantity: 1,
                     imageUrl: controller.products[index].image.toString()
                   );



                          },
                          color: Colors.deepPurple.shade600,
                          buttonWidth: width*0.3,
                      buttonHeight: height*0.05,)
                    ],
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
