import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/Theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.news.length,
        itemBuilder: (BuildContext context, int i) {
          return _Story(
            article: this.news[i],
            index: i,
          );
        });
  }
}

class _Story extends StatelessWidget {
  @required
  final Article article;
  @required
  final int index;

  const _Story({this.article, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(article: article, index: index),
        _TitleCard(article: article),
        _ImageCard(article: article),
        _BodyCard(article: article),
        _ButtonsCard(),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
              fillColor: myTheme.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.star_border),
              onPressed: () {}),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
              fillColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.more),
              onPressed: () {})
        ],
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article article;
  final int index;

  const _TopBarCard({this.article, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text('${article.source.name}.'),
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article article;

  const _TitleCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          article.title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ));
  }
}

class _ImageCard extends StatelessWidget {
  final Article article;

  const _ImageCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (article.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(article.urlToImage))
                : Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article article;

  const _BodyCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((article.description) != null ? article.description : ''),
    );
  }
}
