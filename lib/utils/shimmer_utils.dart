import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUtils {
  static Widget buildShimmer(int itemCount) => ListView.builder(
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                    width: 40.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                    width: double.infinity,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
        itemCount: itemCount, // Numero di skeleton che vuoi mostrare
      );

      static Widget buildIconRow(int itemCount) => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder:(context, index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 95, 89, 89)!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      )),
                  const SizedBox(width: 10,),
                  Container(
                      width: 200,
                      height: 16.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      )),
                ],
              ),
            ),),),
      );
        
}
