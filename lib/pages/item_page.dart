import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFC5A880);
    const backgroundColor = Color(0xFFFAF7F2);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF332C27)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            color: Color(0xFF332C27),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: item.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      item.image,
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2C2523),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp ${item.price}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF9E6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            '${item.rating}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5C524A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F4F7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Stok: ${item.stock} pcs',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5C524A),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}