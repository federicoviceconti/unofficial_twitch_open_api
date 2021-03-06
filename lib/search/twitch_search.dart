import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_get_streams_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_categories_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_channels_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_users_response.dart';

/// You can find methods to search all the information that you need about
/// channels, categories, user or streams
abstract class TwitchSearch extends BaseTwitchOpenApi {
  TwitchSearch(String? token, String? clientId) : super(token, clientId);

  /// Docs: https://dev.twitch.tv/docs/api/reference#search-channels
  Future<HttpResult<OpenApiSearchChannelsResponse>> searchChannels({
    required String query,
    int? first,
    String? after,
    bool? isLive,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#search-categories
  Future<HttpResult<OpenApiSearchCategoriesResponse>> searchCategories({
    required String query,
    int? first,
    String? after,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-users
  Future<HttpResult<OpenApiSearchUsersResponse>> searchUser({
    int? id,
    String? login,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-streams
  Future<HttpResult<OpenApiGetStreamsResponse>> searchStreams({
    final String? after,
    final String? before,
    final int? first,
    final String? gameId,
    final String? language,
    final String? userId,
    final String? userLogin,
  });
}
