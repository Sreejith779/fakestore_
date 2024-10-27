import 'package:fakestore/app/views/cartPage/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/styles.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController()..getCartProducts());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(
            "Cart",
            style: style(20, FontWeight.w700, Colors.black),
          ),
          backgroundColor: Colors.grey.shade100,
        ),
        body: Obx(() => Container(
            child: ListView.builder(
                itemCount: controller.cartProducts.length,
                itemBuilder: (context, index) {
                  print("==================================");
                  return Container(
                      width: width * 0.7,
                      height: height * 0.15,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            controller.cartProducts[index]["imageUrl"],
                            height: height * 0.1,
                            width: width * 0.3,
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Text(
                                    controller.cartProducts[index]["name"],
                                    style: style(
                                        14, FontWeight.w600, Colors.black),
                                    textAlign: TextAlign.left,
                                    maxLines: 05, // Limits to one line of text
                                    overflow: TextOverflow
                                        .ellipsis, // Adds ellipsis if overflow
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10, top: 5),
                                      child: Text(
                                        "\$ ${controller.cartProducts[index]["price"]}",
                                        style: style(
                                            18, FontWeight.w600, Colors.black),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.increment(
                                              productid:
                                                  controller.cartProducts[index]
                                                      ["productid"]);
                                        },
                                        icon: const Icon(Icons.add)),
                                    Expanded(
                                      child: SizedBox(
                                        width: width * 0.03,
                                        child: Text(
                                          controller.cartProducts[index]
                                                  ["quantity"]
                                              .toString(),
                                          style: style(
                                              18, FontWeight.w600, Colors.black),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.decrement(
                                              productid:
                                              controller.cartProducts[index]
                                              ["productid"]);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          controller.deleteItem(
                                              productId:
                                                  controller.cartProducts[index]
                                                      ["productid"]);
                                        },
                                        icon: const Icon(Icons.delete_outline))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                }))));
  }
}
