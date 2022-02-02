/// This class contains all the endpoints and params needed for all the
/// requests
class OpenApiChannelConstants {
  static const String channelInformationEndpoint = '/helix/channels';
  static const String channelStreamScheduleEndpoint = '/helix/schedule';
  static const String channelUsersFollowEndpoint = '/helix/users/follows';
  static const String searchChannelsEndpoint = '/helix/search/channels';
  static const String searchCategoriesEndpoint = '/helix/search/categories';
  static const String searchUsersEndpoint = '/helix/users';
  static const String getChannelTeamsEndpoint = '/helix/teams/channel';
  static const String getTopGameEndpoint = '/helix/games/top';
  static const String getGameEndpoint = '/helix/games';
  static const String getChannelChatBadgesEndpoint = '/helix/chat/badges';
  static const String getChannelEmotesEndpoint = '/helix/chat/emotes';
  static const String getEmoteSetsEndpoint = '/helix/chat/emotes/set';
  static const String getGlobalChatBadgesEndpoint = '/helix/chat/badges/global';
  static const String getGlobalEmotesEndpoint = '/helix/chat/emotes/global';
  static const String getCheermotesEndpoint = '/helix/bits/cheermotes';
  static const String getClipsEndpoint = '/helix/clips';
  static const String getVideosEndpoint = '/helix/videos';
  static const String getStreamsEndpoint = '/helix/streams';

  static const String queryParamBroadcasterId = 'broadcaster_id';
  static const String queryParamFromId = 'from_id';
  static const String queryParamToId = 'to_id';
  static const String queryParamFirst = 'first';
  static const String queryParamAfter = 'after';
  static const String queryParamQuery = 'query';
  static const String queryParamIsLive = 'is_live';
  static const String queryParamId = 'id';
  static const String queryParamLogin = 'login';
  static const String queryParamName = 'name';
  static const String queryParamEmoteSetId = 'emote_set_id';
  static const String queryParamUserId = 'user_id';
  static const String queryParamBefore = 'before';
  static const String queryParamLanguage = 'language';
  static const String queryParamPeriod = 'period';
  static const String queryParamSort = 'sort';
  static const String queryParamType = 'type';
  static const String queryParamGameId = 'game_id';
  static const String queryParamUserLogin = 'user_login';
}
