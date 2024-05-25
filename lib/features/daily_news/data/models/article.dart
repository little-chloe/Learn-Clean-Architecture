import 'package:floor/floor.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
      url: json['url'] ?? 'Unknown',
      urlToImage: json['urlToImage'] ?? 'Unknown',
      publishedAt: json['publishedAt'] ?? 'Unknown',
      content: json['content'] ?? 'Unknown',
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
