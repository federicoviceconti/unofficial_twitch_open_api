import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/unofficial_twitch_http.dart';
import 'package:unofficial_twitch_open_api/core/twitch_open_api_constants.dart';

/// This class contains the main resources to access the data correctly.
///
/// The [token] and [clientId] are needed for authenticate your request. To
/// see how the authentication works, read the at the following link:
/// https://dev.twitch.tv/docs/authentication
///
/// As specified on the documentation
/// (https://dev.twitch.tv/docs/authentication#types-of-tokens):
/// - Client ID are public and can be shared
/// - Client ID should be unique for every application and cannot be reused
abstract class BaseTwitchOpenApi {
  /// Token used for making authorized requests
  final String? token;

  /// Unique id for each application
  final String? clientId;

  /// Update the token
  set token(String? currentToken) {
    token = currentToken;
  }

  /// Used by the package for making HTTP requests
  TwitchHttpClient get client => TwitchHttpClientImpl(
        environmentBundle: EnvironmentBundle(
          basePath: TwitchOpenApiConstants.baseUrl,
        ),
      );

  BaseTwitchOpenApi(this.token, this.clientId);
}
