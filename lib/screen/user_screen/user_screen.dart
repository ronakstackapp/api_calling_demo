import 'dart:convert';

import 'package:api_calling_demo/common/constants/images.dart';
import 'package:api_calling_demo/common/methods/common_loader.dart';
import 'package:api_calling_demo/screen/user_screen/user_screen_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class SimpleApiCalling extends StatefulWidget {
  @override
  State<SimpleApiCalling> createState() => SimpleApiCallingState();
}

class SimpleApiCallingState extends State<SimpleApiCalling> {
 // List<dynamic> apiRes = [];
  UserScreenViewModel? userScreenViewModel;
  // getApiCalling() async {
  //   var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
  //   print("apicalling --->>>>${res.body}");
  //   apiRes = jsonDecode(res.body);
  //   print("apiRes --->$apiRes");
  //   return res;
  // }

  @override
  void initState() {
    // TODO: implement initState
   // getApiCalling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userScreenViewModel ??
        (userScreenViewModel = UserScreenViewModel(this));
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Simple Api Calling",
          ),
        ),
        body: ListView.builder(
          itemCount:userScreenViewModel!.userModelList.length ,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userScreenViewModel!.userModelList[index].title}",
                        //overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "${userScreenViewModel!.userModelList[index].image}",
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => LoadingPage(),
                                  errorWidget: (context, url, error) => Image.asset(
                                    ImageResources.profileImg,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 15,
                                      initialRating: userScreenViewModel!.userModelList[index].rating!.rate!,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                         const EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Text(
                                      "${userScreenViewModel!.userModelList[index].rating!.count}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "id : ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${userScreenViewModel!.userModelList[index].id}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     const Text(
                                //       "Category:- ",
                                //       style: TextStyle(
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //     Text(
                                //       "${apiRes[index]['category']}",
                                //       style: const TextStyle(fontSize: 18),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    const Text(
                                      "Price : ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${userScreenViewModel!.userModelList[index].price}\$",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Count : ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${userScreenViewModel!.userModelList[index].rating!.count}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Category : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${userScreenViewModel!.userModelList[index].category}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "Description : ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${userScreenViewModel!.userModelList[index].description}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
