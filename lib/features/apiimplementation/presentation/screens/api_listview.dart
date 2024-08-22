import 'package:ecph_value/features/apiimplementation/presentation/provider/ph_ec_values_increment_provider.dart';
import 'package:ecph_value/features/apiimplementation/presentation/provider/show_ph_value_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late Box<int> countBox;

  @override
  void initState() {
    super.initState();
    countBox = Hive.box<int>('counttBox');
  }

  @override
  Widget build(BuildContext context) {
    final phValueData = ref.watch(availablePhValueProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ph Values'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: phValueData.when(
          data: (data) {
            int? count = countBox.get('countt', defaultValue: 0);
            int? countPh = countBox.get('countPhh', defaultValue: 0);

            return Column(
              children: [
                SizedBox(
                  height: 307,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/pH-Value.png',
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The PH value of the given API is ${data!.phValue}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Expanded(
                        child: Text(
                          'The EC value of the given API is ${data.ecValue}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Expanded(
                        child: Text(
                          'The chemical level of the given API is ${data.chemical1Count}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Expanded(
                        child: Text(
                          'The chemical level 2,3 of the given API is ${data.chemical2Count},${data.chemical3Count}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(increasePhValueProvider.notifier)
                          .initializeData(data!.phValue!, data.ecValue!);
                      ref
                          .read(increasePhValueProvider.notifier)
                          .incrementPhValue();
                      if (countPh! < 1) {
                        setState(() {
                          countPh = countPh! + 1;
                          countBox.put('countPhh', countPh!);
                        });
                      }
                      print(countPh);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'PH Value',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(increasePhValueProvider.notifier)
                          .incrementEcValue();
                      if (count! < 1) {
                        setState(() {
                          count = count! + 1;
                          countBox.put('countt', count!);
                        });
                      }
                      print(count);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'EC Value',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: SizedBox(
                width: double.infinity,
                height: 190,
                child: Center(
                  child: Text(
                    "We're working to get the events for you.\n Thank you for your patience.",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          loading: () {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
