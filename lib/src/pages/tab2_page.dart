import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/Theme.dart';
import 'package:news_app/src/widgets/NewsList.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsServices>(context).headlines;
    final newsServices = Provider.of<NewsServices>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _CategoriesList(),
          Expanded(child: NewsList(newsServices.getArticlesBySelectedCategory))
        ],
      )),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          itemCount: categories.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final categoryName = categories[index].name;
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(category: categories[index]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      '${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({this.category});

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);

    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewsServices>(context, listen: false);
        newsServices.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newsServices.selectedCategory == this.category.name)
              ? myTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
