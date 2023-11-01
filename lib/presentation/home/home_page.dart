import 'package:e_commerce/common/components/search_input.dart';
import 'package:e_commerce/common/components/space_height.dart';
import 'package:e_commerce/common/constants/colors.dart';
import 'package:e_commerce/presentation/home/widgets/product_model.dart';
import 'package:e_commerce/presentation/home/widgets/category_button.dart';
import 'package:e_commerce/presentation/home/widgets/image_slider.dart';
import 'package:e_commerce/presentation/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../common/constants/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final List<ProductModel> products = [
    ProductModel(
      images: [Images.product1],
      name: 'Tas Kekinian',
      price: 20000,
    ),
    ProductModel(
      images: [Images.product2],
      name: 'Earphone',
      price: 190000,
    ),
    ProductModel(
      images: [Images.product3],
      name: 'Sepatu Pria',
      price: 30000,
    ),
    ProductModel(
      images: [Images.product4],
      name: 'Tas Kekinian',
      price: 50000,
    ),
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Images.recomendedProductBanner,
      Images.recomendedProductBanner,
      Images.recomendedProductBanner,
    ];
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SpaceHeight(20.0),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alamat Pengiriman",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: ColorName.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Lombok,NTB",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorName.primary,
                      ),
                    ),
                    SpaceWidth(5.0),
                    Icon(
                      Icons.expand_more,
                      size: 18.0,
                      color: ColorName.primary,
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Images.iconBuy,
                    height: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Images.iconNotificationHome,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SpaceHeight(16.0),
        SearchInput(
          controller: searchController,
          onChanged: (value) {},
        ),
        const SpaceHeight(16.0),
        ImageSlide(items: images),
        const SpaceHeight(12.0),
        const Text(
          'Kategori',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: ColorName.primary,
          ),
        ),
        const SpaceHeight(12.0),
        Row(
          children: [
            Flexible(
              child: CategoryButton(
                imagePath: Images.fashion1,
                label: 'Pakain',
                onPressed: () {},
              ),
            ),
            Flexible(
              child: CategoryButton(
                imagePath: Images.fashion2,
                label: 'Pakain',
                onPressed: () {},
              ),
            ),
            Flexible(
              child: CategoryButton(
                imagePath: Images.fashion3,
                label: 'Pakain',
                onPressed: () {},
              ),
            ),
            Flexible(
              child: CategoryButton(
                imagePath: Images.more,
                label: 'Pakain',
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SpaceHeight(16.0),
        const Text(
          "Produk",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: ColorName.primary,
          ),
        ),
        const SpaceHeight(8.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 55.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => ProductCard(
            data: products[index],
          ),
        ),
      ],
    ));
  }
}
