import 'statusrequest.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?  const Center(child: MyLoading())
        : statusRequest == StatusRequest.offlinefailure
            ? OfflineWidget(context)
            : statusRequest == StatusRequest.serverfailure
                ? ServerError()
                : widget;
  }
}

class ServerError extends StatelessWidget {
  const ServerError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Server Failure',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
OfflineWidget(BuildContext context) {
  return Center(
    child: Container(
      alignment:Alignment.center ,
      color: Colors.white,
      height: 270,
      width: 200,
      child: Column(
        children: [
          Text('No Internet connection please try again'),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Check_from_internet",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}
class MyLoading extends StatelessWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
