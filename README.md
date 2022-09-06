# 📦 unofficial_twitch_auth

This package allows to retrieve all the data by the newest Twitch APIs.

## Getting started

To make the APIs works, you need to configure your application on Twitch Dev Console. If you don't
how to do, please follow the
steps [here](https://github.com/federicoviceconti/unofficial_twitch_auth#register-your-app-on-twitch-dev-console)
.

To access to the Twitch's data, was implemented the
class [TwitchManagerOpenApi](/lib/twitch_manager_open_api.dart). This utility create an instance of
the available subclass of [BaseTwitchOpenApi](/lib/core/base_twitch_open_api.dart).

```dart
/// You can create the instance of [TwitchManagerOpenApi] via provider or get_it
/// An example below:
List<SingleChildWidget> _initProvider() {
  String clientId = 'your_secret_client_id';

  return [
    Provider<TwitchManagerOpenApi>(
      create: (ctx) =>
          TwitchManagerOpenApi(
            clientId: clientId,
          ),
    ),
  ];
}

/// Then, you can use the instance created previously to retrieve the subclass needed
T getInstance<T extends BaseTwitchOpenApi>() {
  final manager = Provider.of<TwitchManagerOpenApi>();

  return manager.of<T>(bearerToken: 'your_secret_token');
}

/// Finally, use the instance. An example below:
final channelInfo = getInstance<TwitchChannelInformation>(
  bearerToken: 'your_secret_token',
).getChannelInformation(broadcasterId: broadcasterId);
```
