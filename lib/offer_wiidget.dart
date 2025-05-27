import 'package:dynamiui/app_config.dart';
import 'package:flutter/material.dart';

class OfferWiidget extends StatelessWidget {
  const OfferWiidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offers & Discounts",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text("SEE ALL", style: TextStyle(color: AppConfig.viewAllColor)),
            ],
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Card(
                    color: const Color(0xFFE3F2FD),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConfig.offerBr),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.credit_card, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Extra ₹100 off on SBI Applicable on SBI card.. No code required",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (index == 1) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Card(
                    color: const Color(0xFFFFF9C4),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: Icon(Icons.discount, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Get flat 15% Use coupon",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Card(
                    color: const Color(0xFFE8F5E9),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.local_offer, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Buy 1 Get 1 Free on selected items",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
