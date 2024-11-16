import 'package:flutter/material.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/vertical_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GlobalKey<FormState> searchFormKey;
  late final TextEditingController searchController;
  late final FocusNode searchFocus;
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    "Semi rigide",
    "bateau à moteur",
    "katamaran",
    "Yacht",
    "Sailboat",
    "Fishing Boat",
  ];

  final List<Map<String, String>> products = [
    {
      "title": "Fender stratocaster",
      "location": "Marseille (L'Estaque)",
      "price": "1,500 €"
    },
    {"title": "Speedboat", "location": "Cannes", "price": "2,000 €"},
  ];

  @override
  void initState() {
    searchFormKey = GlobalKey<FormState>();
    searchController = TextEditingController();
    searchFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    searchFocus.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 211,
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AssetIcons.homeLogo,
                              width: 127.03,
                              height: 36,
                              fit: BoxFit.fill,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_none_sharp,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const VerticalSpace(height: 20),
                        Text(
                          AppLocalizations.of(context)!.helloJohnSmith,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.haveANiceDay,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -22,
                  left: 16,
                  right: 16,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Clickable(
                      onTap: () => pushToName(RoutesNames.searchScreen),
                      child: Form(
                        key: searchFormKey,
                        child: AppInputField(
                          enabled: false,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 25,
                            color: AppColors.c555555,
                          ),
                          required: false,
                          borderColor: AppColors.white,
                          controller: searchController,
                          focusNode: searchFocus,
                          name: AppLocalizations.of(context)!.search,
                          hint: AppLocalizations.of(context)!.search,
                          onChanged: (value) {
                            searchFormKey.currentState!.validate();
                          },
                          onFieldSubmitted: (value) {
                            searchFormKey.currentState!.validate();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 35),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: selectedCategoryIndex == index
                                  ? AppColors.primary
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.directions_boat_outlined,
                                  color: selectedCategoryIndex == index
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                const HorizontalSpace(width: 10),
                                Text(
                                  categories[index],
                                  style: TextStyle(
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    AppLocalizations.of(context)!.topProducts,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const VerticalSpace(height: 20),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: .78,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(
                    title: products[index]["title"]!,
                    location: products[index]["location"]!,
                    price: products[index]["price"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String location,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AssetIcons.boatImage,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const VerticalSpace(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const VerticalSpace(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          color: AppColors.black, size: 25),
                      Text(
                        location,
                        style: const TextStyle(color: AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                price,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
