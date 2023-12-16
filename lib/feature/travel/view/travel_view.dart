import 'package:flutter/material.dart';
import 'package:flutter_state_management/product/padding/page_padding.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final data = "See All";
  final data2 = "Popular destinations near you";
  final data3 = "Hey John! \n Where do you want to go today?";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Text(data3),
            const TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data2,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(data,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.error))
              ],
            )
          ],
        ),
      ),
    );
  }
}
