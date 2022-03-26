import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location_and_device_details extends StatefulWidget {
  const Location_and_device_details({Key? key}) : super(key: key);

  @override
  State<Location_and_device_details> createState() =>
      _Location_and_device_detailsState();
}

class _Location_and_device_detailsState
    extends State<Location_and_device_details> {
  String location = 'Null, Press Button';
  String address = 'search';
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        }
        //else if (Platform.isLinux) {
        //   deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        // } else if (Platform.isMacOS) {
        //   deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        // } else if (Platform.isWindows) {
        //   deviceData =
        //       _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        // }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      //  'version.securityPatch': build.version.securityPatch,
      // 'version.sdkInt': build.version.sdkInt,
      //'version.release': build.version.release,
      //'version.previewSdkInt': build.version.previewSdkInt,
      // 'version.incremental': build.version.incremental,
      // 'version.codename': build.version.codename,
      // 'version.baseOS': build.version.baseOS,
      // 'board': build.board,
      // 'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      // 'display': build.display,
      // 'fingerprint': build.fingerprint,
      // 'hardware': build.hardware,
      //'host': build.host,
      //'id': build.id,
      //'manufacturer': build.manufacturer,
      'model': build.model,
      //'product': build.product,
      // 'supported32BitAbis': build.supported32BitAbis,
      // 'supported64BitAbis': build.supported64BitAbis,
      // 'supportedAbis': build.supportedAbis,
      // 'tags': build.tags,
      // 'type': build.type,
      // 'isPhysicalDevice': build.isPhysicalDevice,
      // 'androidId': build.androidId,
      // 'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      //  'systemName': data.systemName,
      // 'systemVersion': data.systemVersion,
      'model': data.model,
      // 'localizedModel': data.localizedModel,
      // 'identifierForVendor': data.identifierForVendor,
      // 'isPhysicalDevice': data.isPhysicalDevice,
      // 'utsname.sysname:': data.utsname.sysname,
      // 'utsname.nodename:': data.utsname.nodename,
      // 'utsname.release:': data.utsname.release,
      // 'utsname.version:': data.utsname.version,
      // 'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      // 'appCodeName': data.appCodeName,
      // 'appName': data.appName,
      // 'appVersion': data.appVersion,
      // 'deviceMemory': data.deviceMemory,
      // 'language': data.language,
      // 'languages': data.languages,
      // 'platform': data.platform,
      // 'product': data.product,
      // 'productSub': data.productSub,
      // 'userAgent': data.userAgent,
      // 'vendor': data.vendor,
      // 'vendorSub': data.vendorSub,
      // 'hardwareConcurrency': data.hardwareConcurrency,
      // 'maxTouchPoints': data.maxTouchPoints,
    };
  }

//  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'version': data.version,
//       'id': data.id,
//       'idLike': data.idLike,
//       'versionCodename': data.versionCodename,
//       'versionId': data.versionId,
//       'prettyName': data.prettyName,
//       'buildId': data.buildId,
//       'variant': data.variant,
//       'variantId': data.variantId,
//       'machineId': data.machineId,
//     };
//   }

  // Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  //   return <String, dynamic>{
  //     'computerName': data.computerName,
  //     'hostName': data.hostName,
  //     'arch': data.arch,
  //     'model': data.model,
  //     'kernelVersion': data.kernelVersion,
  //     'osRelease': data.osRelease,
  //     'activeCPUs': data.activeCPUs,
  //     'memorySize': data.memorySize,
  //     'cpuFrequency': data.cpuFrequency,
  //     'systemGUID': data.systemGUID,
  //   };
  // }
  //
  // Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  //   return <String, dynamic>{
  //     'numberOfCores': data.numberOfCores,
  //     'computerName': data.computerName,
  //     'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
  //   };
  // }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView(
              children: _deviceData.keys.map(
                (String property) {
                  return Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          property,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          child: Text(
                            '${_deviceData[property]}',
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          const Text('Coordinates Points',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 10),
          Text(location,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          const Text('ADDRESS',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 10),
          Text(address, style: const TextStyle(color: Colors.white)),
          ElevatedButton(
              onPressed: () async {
                Position position = await _getGeoLocationPosition();
                location =
                    'Lat: ${position.latitude} , Long: ${position.longitude}';
                GetAddressFromLatLong(position);
              },
              child: const Text('Get Location'))
        ],
      ),
    );
  }
}
