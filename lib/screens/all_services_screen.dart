import 'package:demo_batch2/api/APICall.dart';
import 'package:demo_batch2/api/APIResources.dart';
import 'package:demo_batch2/constant/constants.dart';
import 'package:demo_batch2/models/GetAllServicesData.dart';
import 'package:flutter/material.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  bool isLoading = false;
  dynamic allServices;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllServices();
  }

  Future<List<Services>> getAllServices() async {
    setState(() {
      isLoading = true;
    });

    APICall apiCall = APICall();
    List<Services> list = [];

    GetAllServicesData servicesData = await apiCall.getAllServices();
    if (servicesData.status == true) {
      list.addAll(servicesData.services!);
    }
    setState(() {
      allServices = list;
      isLoading = false;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Services"),
      ),
      body: isLoading
          ? CircularProgressIndicator(
              color: Colors.red,
            )
          : RefreshIndicator(
              onRefresh: () => getAllServices(),
              color: Colors.red,
              child: allServices.isEmpty
                  ? Center(child: Text("No Services Found"))
                  : ListView.builder(
                      itemCount: allServices.length,
                      itemBuilder: (context, index) =>
                          serviceCard(allServices[index]),
                    )),
    );
  }

  Widget serviceCard(dynamic service) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: cardDecoration.copyWith(color: Colors.grey),
      child: Column(
        children: [
          Image.network("${APIResource.IMAGE_BASE_URL}${service.photo}"),
          Text(service.nameEn),
          Text(service.description),
          Text(service.price),
        ],
      ),
    );
  }
}
