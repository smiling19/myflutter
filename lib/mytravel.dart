import 'package:flutter/material.dart';

class MyTravel extends StatelessWidget {
  const MyTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: MyBody());
  }

  Widget MyBody() {
    return ListView(
      children: [
        block1(), 
        block2(), 
        block3(), 
        block4(), 
        block5(), 
        block6()],
    );
  }

  Widget block1() {
    return Container(
      color: const Color(0xFF0059C9), // nền xanh phía sau
      padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orangeAccent, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Mũi tên và tiêu đề bên trái
            Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black87,
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text(
                  "Xung quanh vị trí hiện tại",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Ngày tháng bên phải
            const Text(
              "23 thg 10  –  24 thg 10",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget block2() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconOption(Icons.arrow_downward, "Sắp xếp"),
          _iconOption(Icons.tune, "Lọc"),
          _iconOption(Icons.map_outlined, "Bản đồ"),
        ],
      ),
    );
  }

  Widget _iconOption(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22, color: Colors.black54),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget block3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '757 chỗ nghỉ',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  Widget block4() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/picture2.png",
                  width: 110,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B9A54),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Bao bữa sáng",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên + Tim
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "aNhill Boutique",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
                const SizedBox(height: 3),

                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, size: 13, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B5ED7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "9,5",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Xuất sắc · 95 đánh giá",
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Huế · Cách bạn 0,6km",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bên trái để trống (đẩy dòng phòng sang phải)
                    const Expanded(child: SizedBox()),

                    // Bên phải: phòng + giá
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "1 suite riêng tư: 1 giường",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "US\$109",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Đã bao gồm thuế và phí",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget block5() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/picture3.png",
                  width: 110,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B9A54),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Bao bữa sáng",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "An Nam Hue Boutique",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
                const SizedBox(height: 3),

                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, size: 13, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B5ED7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "9,2",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Tuyệt hảo · 34 đánh giá",
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Cư Chính · Cách bạn 0,9km",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: SizedBox()),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "1 phòng khách sạn: 1 giường",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "US\$20",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Đã bao gồm thuế và phí",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget block6() {
    return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/picture3.png",
                width: 110,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B9A54),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Bao bữa sáng",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Huế Jade Hill Villa",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.favorite_border,
                      size: 20, color: Colors.black54),
                ],
              ),
              const SizedBox(height: 3),

              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B5ED7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "8,0",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Rất tốt · 1 đánh giá",
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              const Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 14, color: Colors.black54),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "Cư Chính · Cách bạn 1,3km",
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: SizedBox()),

                  // Phần phải: mô tả phòng, giá, và 2 dòng cuối
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "1 biệt thự nguyên căn - 1.000 m²:\n4 giường · 3 phòng ngủ · 3 phòng tắm",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "US\$285",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Đã bao gồm thuế và phí",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),

                      const SizedBox(height: 6),
                      const Text(
                        "Chỉ còn 1 căn với giá này trên Booking.com",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.right,
                      ),

                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.check_circle_outline,
                              size: 16, color: Colors.green),
                          SizedBox(width: 6),
                          Text(
                            "Không cần thanh toán trước",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}
