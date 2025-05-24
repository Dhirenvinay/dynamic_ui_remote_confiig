import 'package:dynamiui/app_config.dart';
import 'package:dynamiui/deal_widget.dart';
import 'package:dynamiui/gride_builder.dart';
import 'package:dynamiui/offer_wiidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_on_outlined),
        title: ValueListenableBuilder<bool>(
          valueListenable: AppConfig.configUpdated,
          builder: (context, _, child) {
            return Text(AppConfig.appbarText);
          },
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.favorite_border),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 10),
        ],
        elevation: 0,
        // Let the theme control the backgroundColor
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: AppConfig.configUpdated,
        builder: (context, _, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppConfig.bannerBgColor,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "FURLENCO UTSAV",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "FLAT 15% OFF\n• FREE 72hrs Delivery*\n• 300+ Designs\n• Free Installation",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: Colors.white,
                            //     foregroundColor: Colors.black,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //   ),
                            //   child: const Text("BUY NOW"),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "BUY FURNITURE",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),

                const SizedBox(height: 10),
                GrideBuilder(),

                // ValueListenableBuilder<bool>(
                //   valueListenable: AppConfig.configUpdated,
                //   builder: (context, _, child) {
                //     return
                // },
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: const Color(0xFFE0E7FF),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "BUY\nBrand New",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.arrow_forward_ios, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Card(
                          color: const Color(0xFFE0F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "BUY\nRefurbished",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.arrow_forward_ios, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offers & Discounts",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const Text(
                        "SEE ALL",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                OfferWiidget(),

                // Deals of the Day Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.discount, color: Colors.purple),
                          const SizedBox(width: 5),
                          Text(
                            "Deals of the day",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const Text(
                        "View All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                DealWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
