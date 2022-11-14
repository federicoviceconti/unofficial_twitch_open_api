import 'package:unofficial_twitch_open_api/channel_information/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/channel_information/twitch_channel_information_impl.dart';
import 'package:unofficial_twitch_open_api/channel_media/twitch_channel_media.dart';
import 'package:unofficial_twitch_open_api/channel_media/twitch_channel_media_impl.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';
import 'package:unofficial_twitch_open_api/game/twitch_game.dart';
import 'package:unofficial_twitch_open_api/game/twitch_game_impl.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search_impl.dart';

/// Utility class for the usage of the Twitch APIs. For the usage, check the
/// README.md.
class TwitchManagerOpenApi {
  /// The instance generated via the factory
  static TwitchManagerOpenApi? _instance;

  /// Client id of your Twitch app, check the README.md for the configuration
  String? clientId;

  /// Private constructor, which is needed the [clientId] to work correctly
  TwitchManagerOpenApi._({
    required this.clientId,
  });

  /// Factory method, It needs the [clientId] for working correctly
  factory TwitchManagerOpenApi({
    required String? clientId,
  }) {
    _instance ??= TwitchManagerOpenApi._(clientId: clientId);
    return _instance!;
  }

  /// Return an instance of subclass [BaseTwitchOpenApi]. The instances
  /// available are:
  /// - [TwitchChannelInformation] returns generic info about the streamers
  /// channel
  /// - [TwitchChannelMedia] returns all media related data like video or images
  /// - [TwitchSearch] allows to search information about streams
  /// - [TwitchGame] get information about game categories
  ///
  T of<T extends BaseTwitchOpenApi>({required String? bearerToken}) {
    switch (T) {
      case TwitchChannelInformation:
        return TwitchChannelInformationImpl(
          clientId: clientId,
          token: bearerToken,
        ) as T;
      case TwitchSearch:
        return TwitchSearchImpl(
          clientId: clientId,
          token: bearerToken,
        ) as T;
      case TwitchGame:
        return TwitchGameImpl(
          clientId: clientId,
          token: bearerToken,
        ) as T;
      case TwitchChannelMedia:
        return TwitchChannelMediaImpl(
          clientId: clientId,
          token: bearerToken,
        ) as T;
      default:
        throw UnsupportedError(
          'Type of $T is not implemented in TwitchManagerOpenApi.getInstance',
        );
    }
  }
}
