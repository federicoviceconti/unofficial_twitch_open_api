import 'package:flutter/material.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_information_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/twitch_manager_open_api.dart';

void main() {
  runApp(const AppExample());
}

class AppExample extends StatelessWidget {
  const AppExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'unofficial_twitch_open_api Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OpenApiExampleWidget(),
    );
  }
}

class OpenApiExampleWidget extends StatefulWidget {
  const OpenApiExampleWidget({Key? key}) : super(key: key);

  @override
  _OpenApiExampleWidgetState createState() => _OpenApiExampleWidgetState();
}

class _OpenApiExampleWidgetState extends State<OpenApiExampleWidget> {
  String? _bearerToken;
  String? _broadcasterId;

  final TextEditingController _bearerTokenController = TextEditingController();
  final TextEditingController _broadcasterIdController =
      TextEditingController();

  TwitchManagerOpenApi? manager;
  List<ChannelInformationResult> infoResult = [];

  @override
  void initState() {
    manager = TwitchManagerOpenApi(
      clientId: const String.fromEnvironment('API_KEY'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _bearerTokenController,
              onChanged: (value) => setState(() {
                _bearerToken = value;
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _broadcasterIdController,
              onChanged: (value) => setState(() {
                _broadcasterId = value;
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final channelInfo = manager?.of<TwitchChannelInformation>(
                  bearerToken: _bearerToken,
                );

                final responseInfo = await channelInfo?.getChannelInformation(
                  broadcasterId: _broadcasterId ?? '',
                );

                setState(() {
                  infoResult = responseInfo?.result?.channelList ?? [];
                });
              },
              child: const Text('Get random info'),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, index) => ChannelInfoWidget(
                infoResult[index],
              ),
              shrinkWrap: true,
              itemCount: infoResult.length,
            ),
          ],
        ),
      ),
    );
  }
}

class ChannelInfoWidget extends StatelessWidget {
  final ChannelInformationResult informationChannel;

  const ChannelInfoWidget(
    this.informationChannel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(informationChannel.title ?? ''),
        const SizedBox(height: 2),
        Text(informationChannel.gameName ?? ''),
        const SizedBox(height: 2),
        Text(informationChannel.broadcasterLanguage ?? ''),
      ],
    );
  }
}
