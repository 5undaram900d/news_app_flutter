
import 'package:a07_news_app/a03_article_view.dart';
import 'package:a07_news_app/a08_article_model.dart';
import 'package:a07_news_app/a07_category_news_class.dart';
import 'package:flutter/material.dart';

class A02_CategoryNews extends StatefulWidget {

  final catagory;

  const A02_CategoryNews({Key? key, this.catagory}) : super(key: key);

  @override
  State<A02_CategoryNews> createState() => _A02_CategoryNewsState();
}

class _A02_CategoryNewsState extends State<A02_CategoryNews> {

  List<A08_ArticleModel>? articles = <A08_ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
    // print(categories);
  }

  getCategoryNews() async {
    A06_CategoryNewsClass newsClass = A06_CategoryNewsClass();
    await newsClass.getNews(widget.catagory);
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
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          )
        ],
      ),

      body:_loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: articles!=null ? articles!.length : 0,
                        itemBuilder: (context, index){
                          return BlogTile(imageUrl: articles![index].urlToImage, title: articles![index].title, desc: articles![index].description, url: articles![index].url,);
                        },
                      ),
                    ),
                  ],
                ),
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
