import 'package:flutter/material.dart';

class Product {
  final String imagePath;
  final String title;
  final int point;

  const Product(this.imagePath, this.title, this.point);

  Widget get imageWidget {
    return Image.asset(
      imagePath,
      height: 25.0,
    );
  }
}

final List<Product> products = [
  Product('assets/img/time1.png', '기본 눈사람', 2000),
  Product('assets/img/time2.png', '중절모 눈사람', 2000),
  Product('assets/img/time3.png', '빨간 모자 눈사람', 2000),
  Product('assets/img/time4.png', '안전모 눈사람', 2000),
  Product('assets/img/time5.png', '한복 눈사람', 2000),
  Product('assets/img/time6.png', '큐트 눈사람', 2000),
  Product('assets/img/time7.png', '마술사 눈사람', 2000),
  Product('assets/img/time8.png', '몬스터 눈사람', 2000),
];

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) =>
                  _buildProductItem(context, products[index]),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProductItem(BuildContext context, Product product) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: product.imageWidget, // SVG 이미지 위젯을 가져옵니다.
          ),
          const SizedBox(height: 6),
          Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '${product.point}P',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'DNFBitBit',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
