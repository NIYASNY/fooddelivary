import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/home/widgets/promocard.dart';
import 'package:flutter_ecommercedeliveryapp/utils/constants/image_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLocation = locationsList[0];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          selectedIndex = 0;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Delivo"),
          ),
          
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: AppColors.kBlackColor,
                  )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Discover good food around you",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kBlackColor),
                  ),
                ),
                const SizedBox(height: 30),
                const MySearchBar(),
                const SizedBox(height: 20),
                PromoCard(),
                
                const SizedBox(height: 20),
                SizedBox(
                  height: 230,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 30),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return ItemsCard(foodModel: foodList[index], onTap: () {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemsCard extends StatefulWidget {
  final VoidCallback onTap;
  final FoodModel foodModel;

  const ItemsCard({
    super.key,
    required this.foodModel,
    required this.onTap,
  });

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage(widget.foodModel.image), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyStarWidget(
              rating: widget.foodModel.rating,
              color: AppColors.kWhiteColor,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Text(
                                widget.foodModel.title,
                                style: const TextStyle(
                                    fontSize: 10, color: AppColors.kWhiteColor),
                              ),
                            ),
                          ),
                          const Icon(Icons.favorite,
                              color: AppColors.kPrimaryColor),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Rs",
                            style: TextStyle(
                                fontSize: 12, color: AppColors.kPrimaryColor),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            widget.foodModel.price,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.kWhiteColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyStarWidget extends StatelessWidget {
  final Color color;
  final String rating;
  const MyStarWidget({
    super.key,
    required this.rating,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text(
          rating,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      ],
    );
  }
}

List<String> locationsList = [
  "Manhattan, NY",
  "Brooklyn, NY",
  "Queens, NY",
];

class AppColors {
  static const kPrimaryColor = Color(0xffF43F5E);
  static const kBackgroundColor = Color(0xff161B1F);
  static const kGreyColor = Color(0xff8e94a3);
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kLightGrey = Color(0xFFE0E0E0);
  static const kOrangeColor = Colors.deepOrange;
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: const TextStyle(fontSize: 12, color: AppColors.kWhiteColor),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kGreyColor, width: 0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: 'Try "Burger King"',
          hintStyle: const TextStyle(fontSize: 12, color: AppColors.kGreyColor),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.kGreyColor,
          ),
          suffixIcon: const Icon(
            Icons.more_horiz_rounded,
            color: AppColors.kGreyColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide:
                const BorderSide(color: AppColors.kGreyColor, width: 0.3),
          ),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        ),
      ),
    );
  }
}

class CategoriesCard extends StatefulWidget {
  final bool isSelected;
  final CategoriesModel categoriesModel;
  final VoidCallback onTap;

  const CategoriesCard({
    super.key,
    required this.categoriesModel,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.isSelected
              ? AppColors.kPrimaryColor
              : AppColors.kBackgroundColor,
          border: Border.all(
            color: widget.isSelected
                ? AppColors.kPrimaryColor
                : AppColors.kGreyColor,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              widget.categoriesModel.image,
              height: 15,
            ),
            const SizedBox(width: 5),
            Text(
              widget.categoriesModel.title,
              style:
                  const TextStyle(fontSize: 12, color: AppColors.kWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesModel {
  final String title;
  final String image;

  CategoriesModel({
    required this.title,
    required this.image,
  });
}

List categoriesList = [
  CategoriesModel(
    title: "All Food",
    image: AppAssets.kAllFood,
  ),
  CategoriesModel(
    title: "Chicken",
    image: AppAssets.kChicken,
  ),
  CategoriesModel(
    title: "Burger",
    image: AppAssets.kBurger,
  )
];

class FoodModel {
  final String title;
  final String image;
  final String detailImage;
  final String price;
  final String rating;
  final String description;
  final String ingredients;
  final String ingredientsImage;

  FoodModel({
    required this.title,
    required this.image,
    required this.detailImage,
    required this.price,
    required this.rating,
    required this.description,
    required this.ingredients,
    required this.ingredientsImage,
  });
}

List foodList = [
  FoodModel(
    title: "Bowl of Porridge with Fruits",
    description:
        "Bowl of Porridge with Fruits is a hearty “main dish” kind of salad with bold flavors. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together.",
    image:AssetImagepath.kimage1,
    detailImage: AppAssets.kDetailFood1,
    price: "9.67",
    rating: "4.5",
    ingredients: "Spinach",
    ingredientsImage: AppAssets.kVegetable1,
  ),
  FoodModel(
    title: "Egg Delight with Vegetables",
    description:
        "Egg Delight with Vegetables is a hearty “main dish” kind of salad with bold flavors. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together.",
    image: AssetImagepath.kimage2,
    detailImage: AppAssets.kDetailFood2,
    price: "8.00",
    rating: "4.7",
    ingredients: "Chicken",
    ingredientsImage: AppAssets.kChicken,
  ),
  FoodModel(
    title: "Fruits Salad with Honey",
    description:
        "Fruits Salad with Honey is a hearty “main dish” kind of salad with bold flavors. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together.",
    image: AssetImagepath.kimage3,
    detailImage: AppAssets.kDetailFood3,
    price: "5.48",
    rating: "4.3",
    ingredients: "Mushroom",
    ingredientsImage: AppAssets.kVegetable2,
  ),
  FoodModel(
    title: "Bowl of Porridge with Fruits",
    description:
        "Bowl of Porridge with Fruits is a hearty “main dish” kind of salad with bold flavors. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together.",
    image: AssetImagepath.kimage4,
    detailImage: AppAssets.kDetailFood1,
    price: "9.67",
    rating: "4.5",
    ingredients: "Onion",
    ingredientsImage: AppAssets.kVegetable3,
  ),
  FoodModel(
    title: "Egg Delight with Vegetables",
    description:
        "Egg Delight with Vegetables is a hearty “main dish” kind of salad with bold flavors. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together.",
    image:AssetImagepath.kimage5,
    detailImage: AppAssets.kDetailFood2,
    price: "8.00",
    rating: "4.7",
    ingredients: "Chicken",
    ingredientsImage: AppAssets.kChicken,
  ),
  FoodModel(
    title: "Fruits Salad with Honey",
    description:
        "Fruits Salad with Honey is a hearty “main dish” kind of salad with bold flavors. Chicken breasts are marinated in cilantro lime goodness, then seared until golden and added to a bed of romaine lettuce along with sweet corn, black beans, and grape tomatoes. A generous drizzle of creamy avocado dressing ties it all together.",
    image: AssetImagepath.kimage6,
    detailImage: AppAssets.kDetailFood3,
    price: "5.48",
    rating: "4.3",
    ingredients: "Cookies",
    ingredientsImage: AppAssets.kAllFood,
  ),
];

class AppAssets {
  static String kAllFood = 'assets/foodDelivery/cookie.png';
  static String kChicken = 'assets/foodDelivery/chicken.png';
  static String kBurger = 'assets/foodDelivery/burger.png';
  static String kFire = 'assets/foodDelivery/fire.png';
  static String kFood1 = 'assets/foodDelivery/food1.PNG';
  static String kFood2 = 'assets/foodDelivery/food2.PNG';
  static String kFood3 = 'assets/foodDelivery/food3.PNG';
  static String kDetailFood1 = 'assets/foodDelivery/detailFood1.png';
  static String kDetailFood2 = 'assets/foodDelivery/detailFood2.png';
  static String kDetailFood3 = 'assets/foodDelivery/detailFood3.png';
  static String kVegetable1 = 'assets/foodDelivery/vegetable1.png';
  static String kVegetable2 = 'assets/foodDelivery/vegetable2.png';
  static String kVegetable3 = 'assets/foodDelivery/vegetable3.png';
}