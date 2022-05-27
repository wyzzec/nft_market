import 'package:flutter/material.dart';
import 'package:nft_market/widgets/stroked_text_widget.dart';
class TopNftItemLoading extends StatelessWidget {
  const TopNftItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 8),
          child: SizedBox(
            width: 210,
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ))
              ],
            ),
          ),
        ),
        Positioned(
          top: 75,
          right: 10,
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                onPressed: () {},
                child: const StrokedTextWidget(
                    text: 'BUY NOW',
                    fontSize: 16,
                    internColor: Colors.grey,
                    strokeColor: Colors.grey),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                onPressed: () {
                },
                child: const StrokedTextWidget(
                    text: 'More details',
                    fontSize: 12,
                    internColor: Colors.grey,
                    strokeColor: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
