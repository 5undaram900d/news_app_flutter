
import 'package:a07_news_app/a02_category_news.dart';
import 'package:a07_news_app/a03_article_view.dart';
import 'package:a07_news_app/a04_data.dart';
import 'package:a07_news_app/a05_category_model.dart';
import 'package:a07_news_app/a06_news.dart';
import 'package:a07_news_app/a08_article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class A01_MainHome extends StatefulWidget {
  const A01_MainHome({Key? key}) : super(key: key);

  @override
  State<A01_MainHome> createState() => _A01_MainHomeState();
}

class _A01_MainHomeState extends State<A01_MainHome> {

  List<A05_CategoryModel>? categories = <A05_CategoryModel>[];
  List<A08_ArticleModel>? articles = <A08_ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    super.initState();

    categories = getCategories();
    getNews();
    // print(categories);
  }

  getNews() async {
    A06_News newsClass = A06_News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Current', style: TextStyle(color: Colors.black),),
            Text('News', style: TextStyle(color: Colors.blue),),
          ],
        ),
      ),

      body: _loading
        ? const Center(child: CircularProgressIndicator(),)
        : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [

                  // Categories
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,           //much important
                      scrollDirection: Axis.horizontal,     // for horizontal view
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories!=null ? categories!.length : 0,       // best code to remove null check operator error
                      itemBuilder: (context, index){
                        return CategoryTile(imageUrl: categories![index].imageUrl, categoryName: categories![index].categoryName,);
                      },
                    ),
                  ),

                  // Blogs
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: articles!=null ? articles!.length : 0,
                      itemBuilder: (context, index){
                        return BlogTile(imageUrl: articles![index].urlToImage, title: articles![index].title, desc: articles![index].description, url: articles![index].url,);
                      },),
                  )

                ],
              ),
            ),
        ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  
  final imageUrl, categoryName;

  const CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => A02_CategoryNews(catagory: categoryName.toString().toLowerCase(),)),);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,),
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(categoryName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}



class BlogTile extends StatelessWidget {

  final String? imageUrl;
  final String? title;
  final String? desc;
  final String? url;

  const BlogTile({Key? key, required this.imageUrl, required this.title, required this.desc, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => A03_ArticleView(blogUrl: url,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl!),
            ),
            const SizedBox(height: 8,),
            Text(title!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87),),
            const SizedBox(height: 8,),
            Text(desc!, style: const TextStyle(color: Colors.black54),),
          ],
        ),
      ),
    );
  }
}
