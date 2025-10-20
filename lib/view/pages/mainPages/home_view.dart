import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
        body: SingleChildScrollView(
          child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [ // --- 2. Greeting and Subtitle ---
                const Text(
                  'Hello',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Welcome to Laza.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ]),


        const SizedBox(height: 25),

        // --- 3. Search Bar and Filter Icon ---
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.purple.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  SvgPicture.asset(
                'assets/icons/voice.svg',
                color: Colors.white,
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        const _SectionHeader(title: 'Choose Brand'),
        SizedBox(
          height: 40,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _BrandChip(label: 'Adidas', isSelected: true),
              _BrandChip(label: 'Nike', isSelected: false),
              _BrandChip(label: 'FILA', isSelected: false),
              _BrandChip(label: 'Pila', isSelected: false),
              _BrandChip(label: 'Puma', isSelected: false),
            ],
          ),
        ),

        const SizedBox(height: 30),

        const _SectionHeader(title: 'New Arrival'),
        const SizedBox(height: 15),

        // Product Grid View
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
          children: const [
            _ProductCard(name: 'Nike Sportswear Club \n Fleece', price: '\$89', image: Image(image: AssetImage("assets/images/as.png")),),
            _ProductCard(name: 'Trail Running Jacket Nike Windrunner', price: '\$99', image: Image(image: AssetImage("assets/images/as.png"))),
            _ProductCard(name: 'Another Product Title', price: '\$75', image: Image(image: AssetImage("assets/images/as.png"))),
            _ProductCard(name: 'Last Item in New Arrival', price: '\$110', image: Image(image: AssetImage("assets/images/as.png"))),
          ],
        ),
      ]),
    ));
  }

  _appBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          backgroundColor: Color(0xffF5F6FA),
          child: SvgPicture.asset("assets/icons/menu.svg"),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: Color(0xffF5F6FA),
            child: SvgPicture.asset("assets/icons/cart.svg"),
          ),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// --- Helper Widgets ---
// -----------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(color: Colors.grey))),
      ],
    );
  }
}

class _BrandChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _BrandChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? Colors.black : Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String price;
  // final Color color;

  final Image image; // Placeholder color for the image area
  const _ProductCard({required this.name, required this.price,  required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // --- Image Area and Heart Icon ---
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: color.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  ),
                  child: Center(child: image),
                ),

                // Heart Icon (Favorite Button)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      child:  SvgPicture.asset(
                        'assets/icons/heart.svg',
                        width: 24,
                        height: 24,
                    ),
                  ),
                ),
                )],
            ),
          ),

          // --- Product Details ---
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}