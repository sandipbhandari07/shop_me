import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/theme/theme.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        title: Text(
          'Categories',
          style: TextStyle(
            color: AppColors.dimblack,
            fontFamily: 'Montse',
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Category>>(
        future: fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => fetchCategories(), // Retry fetching
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.category, color: Colors.grey, size: 50),
                  SizedBox(height: 10),
                  Text('No categories found', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          } else {
            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: category.categoryImage != null
                        ? Image.network(
                      category.categoryImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                        : Icon(Icons.category, size: 50),
                    title: Text(
                      category.categoryName,
                      style: TextStyle(
                        fontFamily: 'Montse',
                      ),
                    ),
                    subtitle: Text(
                      category.parentCategory,
                      style: TextStyle(
                        fontFamily: 'Montse',
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {

                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('https://inventory.anoopinnovations.com/api/customer/category'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

class Category {
  final int id;
  final String categoryName;
  final String categorySlug;
  final String? categoryImage;
  final String description;
  final int parentId;
  final String parentCategory;
  final String categoryStatus;
  final String iconClass;

  Category({
    required this.id,
    required this.categoryName,
    required this.categorySlug,
    this.categoryImage,
    required this.description,
    required this.parentId,
    required this.parentCategory,
    required this.categoryStatus,
    required this.iconClass,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['category_name'],
      categorySlug: json['category_slug'],
      categoryImage: json['category_image'],
      description: json['description'],
      parentId: json['parent_id'],
      parentCategory: json['parent_category'],
      categoryStatus: json['category_status'],
      iconClass: json['icon_class'],
    );
  }
}
