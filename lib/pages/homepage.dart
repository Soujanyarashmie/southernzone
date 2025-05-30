import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),

                /// Greeting Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hey, ',
                        style: TextStyle(fontSize: 13.sp, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Mano Ramesh!\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: 'Let\'s start exploring',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/Profile');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.notifications_none),
                          SizedBox(width: 2.w),
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/100', // dummy avatar
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),

                /// Search Box
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Land, Apartment, etc.',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),

                SizedBox(height: 2.h),

                /// Filters Row
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 5.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: '< ₹500',
                            items: ['< ₹500', '< ₹1000', '< ₹1500']
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Container(
                        height: 5.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: 'Coimbatore',
                            items: ['Coimbatore', 'Chennai', 'Bangalore']
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    SizedBox(
                      height: 5.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Apply Filters',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),

                /// Explore Properties Section
                Text(
                  'Explore Properties',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                SizedBox(height: 1.h),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 10.h, // or any height you prefer
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 0,
                  ),
                  items: [
                    'assets/images/caurosel1.png',
                    'assets/images/image.png',
                  ].map((assetPath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                SizedBox(height: 3.h),

                /// Featured Properties Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Properties',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle dropdown or navigation
                        },
                        icon: Icon(Icons.keyboard_arrow_down,
                            size: 18, color: Colors.white),
                        label: Text(
                          'See All',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16), // no vertical padding needed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 1.h),

                /// Featured Property Card
                buildPropertyCard(
                  image: 'assets/images/dummy1.png',
                  name: 'Modern Family Home',
                  location: 'Thoothukudi',
                  area: '1,800 sq ft',
                    onCardTap: () {
                    context.push('/viewproperty');
                  },
                  onInvestTap: () {
                    context.push('/viewproperty');
                  },
                ),

                SizedBox(height: 2.h),
                buildPropertyCard(
                  image: 'assets/images/dummy2.jpg',
                  name: 'Modern Family Home',
                  location: 'Salem',
                  area: '1,600 sq ft',
                    onCardTap: () {
                    context.push('/viewproperty');
                  },
                  onInvestTap: () {
                    context.push('/viewproperty');
                  },
                ),

                buildPropertyCard(
                  image: 'assets/images/dummy1.png',
                  name: 'Modern Family Home',
                  location: 'banglore',
                  area: '1,800 sq ft',
                  onCardTap: () {
                    context.push('/viewproperty');
                  },
                  onInvestTap: () {
                    context.push('/viewproperty');
                  },
                ),

                SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPropertyCard({
  required String image,
  required String name,
  required String location,
  required String area,
  required VoidCallback onCardTap,
  required VoidCallback onInvestTap,
}) {
  return GestureDetector(
    onTap: onCardTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 2.h),
      height: 18.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Left Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              width: 40.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Right Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title & Location
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        'Area $area',
                        style: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  /// Invest Button with onTap
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: onInvestTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Invest Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
