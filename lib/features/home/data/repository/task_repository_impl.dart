// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:fireapp/core/resources/data_state.dart';




// class ArticleRepositoryImpl implements ArticleRepository {
//   // final  _newsApiService;
//   // final AppDatabase _appDatabase;
//   // ArticleRepositoryImpl(this._newsApiService,this._appDatabase);
  
//   @override
//   Future<DataState<List<ArticleModel>>> getTask() async {
//    try {
//     // final httpResponse = await _newsApiService.getNewsArticles(
//     //   apiKey:newsAPIKey,
//     //   country:countryQuery,
//     //   category:categoryQuery,
//     // );

//     if (httpResponse.response.statusCode == HttpStatus.ok) {
//       return DataSuccess(httpResponse.data);
//     } else {
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           type: DioErrorType.response,
//           requestOptions: httpResponse.response.requestOptions
//         )
//       );
//     }
//    } on DioError catch(e){
//     return DataFailed(e);
//    }
//   }

//   @override
//   Future<List<ArticleModel>> getSavedArticles() async {
//     return _appDatabase.articleDAO.getArticles();
//   }

//   @override
//   Future<void> removeArticle(ArticleEntity article) {
//     return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
//   }

//   @override
//   Future<void> saveArticle(ArticleEntity article) {
//     return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
//   }
  
// }









// // class ArticleRepositoryImpl extends ArticleRepository {
// //   final NewsApiService _newsApiService;
// //   ArticleRepositoryImpl(this._newsApiService):super(_newsApiService);
 
// //   @override
// //   Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
// //     try {
// //       final httpResponse = await _newsApiService.getNewsArticles(
// //         apiKey: newsApiBaseUrl,
// //         country: countryQuery,
// //         category: categoryQuery,
// //       );

// //       if (httpResponse.response.statusCode == HttpStatus.ok) {
// //         return DataSuccess(httpResponse.data);
// //       } else {
// //         return DataFailed(DioError(error: httpResponse.response.statusMessage, response: httpResponse.response, type: DioErrorType.badResponse, requestOptions: httpResponse.response.requestOptions));
// //       }
// //     } on DioError catch (e) {
// //       return DataFailed(e);
// //     }
// //   }
// // }
