import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SignalrClient {
  final HubConnection connection;
  SignalrClient()
    : connection = HubConnectionBuilder()
          .withUrl('')
          .withAutomaticReconnect()
          .build();
}
