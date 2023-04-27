
import 'package:a07_news_app/a05_category_model.dart';

List<A05_CategoryModel>? getCategories(){
  List<A05_CategoryModel> category = <A05_CategoryModel>[];

  A05_CategoryModel categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1470229538611-16ba8c7ffbd7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://plus.unsplash.com/premium_photo-1661758899958-050ce4481f35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1954&q=80";
  category.add(categoryModel);

  categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1518152006812-edab29b069ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://media.istockphoto.com/id/1473024428/photo/female-rugby-team.jpg?s=2048x2048&w=is&k=20&c=rgBjb9i8JH8W_I76Qs3uAag48ZKUyo8Wa5AwkRj7D1k=";
  category.add(categoryModel);

  categoryModel = A05_CategoryModel();
  categoryModel.categoryName = "technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  return category;

}