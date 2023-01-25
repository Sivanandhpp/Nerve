import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: ThemeColor.shimmerBG,
          highlightColor: ThemeColor.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 18,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: ThemeColor.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 32,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: ThemeColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ThemeColor.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          )
                        ],
                      ),
                      sb.height20,
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: ThemeColor.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      sb.height20,
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      sb.height10,
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      sb.height10,
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 70,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     color: ThemeColor.lightGrey,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
