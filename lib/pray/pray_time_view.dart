import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/pray/data/domain/cubit.dart';
import 'package:fortress_of_the_muslim/pray/data/domain/state_cubit.dart';

class PrayerTimesScreen extends StatelessWidget {
  final String city;

  const PrayerTimesScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // إضافة Scaffold هنا
      appBar: AppBar(
        title: Text('Prayer Times for $city'),
      ),
      body: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
        builder: (context, state) {
          if (state is PrayerTimesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PrayerTimesLoaded) {
            final times = state.prayerTimes.items?.first;
            if (times == null) {
              return const Center(child: Text('No prayer times available.'));
            }
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                PrayerTimeTile(title: 'Fajr', time: times.fajr ?? 'N/A'),
                PrayerTimeTile(title: 'Dhuhr', time: times.dhuhr ?? 'N/A'),
                PrayerTimeTile(title: 'Asr', time: times.asr ?? 'N/A'),
                PrayerTimeTile(title: 'Maghrib', time: times.maghrib ?? 'N/A'),
                PrayerTimeTile(title: 'Isha', time: times.isha ?? 'N/A'),
              ],
            );
          } else if (state is PrayerTimesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PrayerTimesCubit>().fetchPrayerTimes(city);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class PrayerTimeTile extends StatelessWidget {
  final String title;
  final String time;

  const PrayerTimeTile({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.alarm, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
