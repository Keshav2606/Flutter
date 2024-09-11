import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getCategories();
    List<DietModel> recommendations = DietModel.getRecommendations();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          searchBar(),
          categorySection(categories),
          dietSection(recommendations)
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.only(left: 15, top: 8),
          //       width: double.infinity,
          //       color: Colors.lightBlue,
          //       child: const Text(
          //         'Recommendation for Diet',
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     ListView.separated(
          //         scrollDirection: Axis.horizontal,
          //         padding: const EdgeInsets.all(12),
          //         itemCount: categories.length,
          //         separatorBuilder: (context, index) {
          //           return const SizedBox(
          //             width: 12,
          //           );
          //         },
          //         itemBuilder: (_, index) {
          //           return Container(
          //             width: 80,
          //             decoration: BoxDecoration(
          //               borderRadius:
          //                   const BorderRadius.all(Radius.circular(11)),
          //               color: categories[index].boxColor,
          //             ),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 CircleAvatar(
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(6.0),
          //                     child: Image.asset(categories[index].iconPath),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(
          //                     categories[index].name,
          //                     style: const TextStyle(color: Colors.white),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         }),
          //   ],
          // ),
        ],
      ),
    );
  }

  Container dietSection(List<DietModel> recommendations) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, top: 8),
            width: double.infinity,
            child: const Text(
              'Recommendations for Diet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 6.0),
            color: Colors.white,
            height: 240,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                itemCount: recommendations.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemBuilder: (_, index) {
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(11)),
                      color: recommendations[index].boxColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          minRadius: 4,
                          maxRadius: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(recommendations[index].iconPath),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recommendations[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Container categorySection(List<CategoryModel> categories) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, top: 8),
            width: double.infinity,
            child: const Text(
              'Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 6.0),
            color: Colors.white,
            height: 120,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                itemCount: categories.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemBuilder: (_, index) {
                  return Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(11)),
                      color: categories[index].boxColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(categories[index].iconPath),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Center searchBar() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        decoration: BoxDecoration(
            border: null,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  color: const Color(0xFF1D1617).withOpacity(0.11),
                  offset: const Offset(4.0, 4.0)),
            ]),
        child: const TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon:
                    IconButton(onPressed: null, icon: Icon(Icons.search_sharp)),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.all_inclusive)))),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print("Back Button Tapped.");
        },
        child: Container(
          width: 20,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color(0xFFF7F8F8),
              borderRadius: BorderRadius.all(Radius.circular(11))),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("Dots button Tapped.");
          },
          child: Container(
              width: 37,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xFFF7F8F8),
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              child: const Icon(
                Icons.add,
              )),
        ),
      ],
    );
  }
}
