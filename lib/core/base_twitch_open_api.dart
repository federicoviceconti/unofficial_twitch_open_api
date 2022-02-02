import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/unofficial_twitch_http.dart';
import 'package:unofficial_twitch_open_api/core/twitch_open_api_constants.dart';

/// This class contains the main resources to access the data correctly.
///
/// The [token] and [clientId] are needed for authenticate your request. To
/// see how the authentication works, read the at the following link:
/// https://dev.twitch.tv/docs/authentication
///
/// The [client] instance is used to make the HTTP requests.
abstract class BaseTwitchOpenApi {
  final String? token;

  final String? clientId;

  set token(String? currentToken) {
    token = currentToken;
  }

  TwitchHttpClient get client => TwitchHttpClientImpl(
        environmentBundle: EnvironmentBundle(
          basePath: TwitchOpenApiConstants.baseUrl,
        ),
      );

  BaseTwitchOpenApi(this.token, this.clientId);
}
