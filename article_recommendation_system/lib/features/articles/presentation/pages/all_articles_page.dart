import 'package:article_recommendation_system/features/articles/presentation/bloc/articles_bloc/article_bloc.dart';
import 'package:article_recommendation_system/features/articles/presentation/pages/one_article_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the fetch event when the page is created
    Future.microtask(() {
      context.read<ArticleBloc>().add(FetchArticles());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Articles")),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticleListLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text("by ${article.author} - ${article.date}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OneArticlePage(articleJson: article),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is ArticleFailure) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("No articles loaded."));
        },
      ),
    );
  }
}
