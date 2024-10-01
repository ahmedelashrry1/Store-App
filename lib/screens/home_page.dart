import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/prodect_model.dart';
import 'package:store_app/service/get_all_prodect.dart';
import 'package:store_app/widget/ProductCard.dart';
import 'package:store_app/widget/use.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff8AAE92),
        elevation: 0,
        title: const Text('Store Every Day',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: SingleChildScrollView( // إضافة SingleChildScrollView هنا
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: SearchField()),
                  const SizedBox(width: 0),
                  IconBtnWithCounter(
                    icon: Icons.shopping_cart,
                    press: () {},
                  ),
                  const SizedBox(width: 8),
                  IconBtnWithCounter(
                    icon: Icons.notifications,
                    press: () {},
                  ),
                ],
              ),
            ),
            const DiscountBanner(),
            // احرص على أن يكون لديك ارتفاع محدد لـ Expanded في GridView
            // في حال عدم وجود محتوى كافٍ لتمريره
            FutureBuilder<List<ProdectModel>>(
              future: GetAllProduct().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProdectModel> products = snapshot.data!;
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // منع التمرير داخل GridView
                    shrinkWrap: true, // يسمح بتقليص ارتفاع GridView
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: Product(
                          colors: [Colors.red, Colors.blue, Colors.green],
                          title: products[index].title ?? '',
                          images: [products[index].image ?? ''],
                          price: products[index].price,
                        ),
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            'UpdateProdect',
                            arguments: products[index],
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff8AAE92),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

