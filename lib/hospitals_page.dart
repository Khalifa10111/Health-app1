import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalsPage extends StatelessWidget {
  const HospitalsPage({Key? key}) : super(key: key);

  Future<void> _openNearbyHospitals(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمات الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خدمة الموقع غير مفعلة')),
      );
      return;
    }

    // تحقق من الإذن
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('صلاحية الموقع مرفوضة نهائياً')),
      );
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('لم يتم منح صلاحية الموقع')),
        );
        return;
      }
    }

    // الحصول على الموقع الحالي
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final url =
        'https://www.google.com/maps/search/مستشفى/@${position.latitude},${position.longitude},15z';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تعذر فتح الخرائط')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('أقرب المستشفيات')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _openNearbyHospitals(context),
          icon: Icon(Icons.local_hospital),
          label: Text('عرض المستشفيات القريبة'),
        ),
      ),
    );
  }
}
