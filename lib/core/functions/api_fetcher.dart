import 'package:flutter/material.dart';
// import 'apis.dart';
import 'package:payments/index.dart';
// import 'package:image_picker/image_picker.dart';

class ApiFetcher {
  ApiFetcher._();

  // create a constructor for the class
  static final ApiFetcher _instance = ApiFetcher._();
  static ApiFetcher get instance => _instance;

  UserActors userActor = UserActors();
  // ServiceActors serviceActors = ServiceActors();
  // HostedServiceActors hostedServiceActors = HostedServiceActors();
  // ReviewsActors serviceReviewsActors = ReviewsActors();

  /*
  * ######################################################
  * ############## Get user data #########################
  * ######################################################
  * */
  Future<dynamic> getUserDataWithPhoneNumber({required String phoneNumber}) async {
    debugPrint("Get user with phone number api being called");
    dynamic userData = await ApiHelperFunctions.getUserWithPhoneNumber(phoneNumber: phoneNumber);
    // debugPrint("user data to be fetched is $userData");
    if (userData != null) {
      debugPrint("customer user data fetched ${userData}");

      // create a new map with the formatted date
      Map<String, dynamic> formattedUserData = {
        'id': userData['id'].toString(),
        'firstName': userData['first_name'].toString(),
        'lastName': userData['last_name'].toString(),
        'otherNames': userData['customers']['other_names'].toString(),
        'mobileNumber': userData['customers']['mobile_number'].toString(),
        'email': userData['email'].toString(),
        'address': userData['customers']['address'].toString(),
        'idType': userData['customers']['id_type'].toString(),
        'idNumber': userData['customers']['id_number'].toString(),
        'nationality': userData['customers']['nationality'].toString(),
        'profession': userData['customers']['profession'].toString(),
        'is_host': userData['customers']['is_host'].toString(),
        'type': 'login',
      };
      debugPrint("formated data is $formattedUserData");
      userActor.updateUser(UserModel.fromMap(formattedUserData));

      userData = formattedUserData;
    }

    return userData;
  }

  /*
  * ######################################################
  * ############## Get user data #########################
  * ######################################################
  * */
  // Future<dynamic> registerCustomer({
  //   required String firstname,
  //   required String lastname,
  //   required String dob,
  //   required String gender,
  //   required String mobilenumber,
  //   required String email,
  // }) async {
  //   debugPrint("Get user with phone number api being called");
  //   dynamic userData = await ApiHelperFunctions.createProfile(firstname: firstname, lastname: lastname, dob: dob, gender: gender, mobilenumber: mobilenumber, email: email);
  //   // debugPrint("user data to be fetched is $userData");
  //   if (userData != null) {
  //     debugPrint("customer user data fetched ${userData}");
  //
  //     // create a new map with the formatted date
  //     Map<String, dynamic> formattedUserData = {
  //       'firstName': userData['first_name'].toString(),
  //       'lastName': userData['last_name'].toString() == null ? userData['last_name'].toString() : '',
  //       'otherNames': userData['customers']['other_names'].toString() == null ? userData['customers']['other_names'].toString() : '',
  //       'mobileNumber': userData['customers']['mobile_number'].toString(),
  //       'email': userData['email'].toString(),
  //       'address': userData['customers']['address'].toString(),
  //       'idType': userData['customers']['id_type'].toString(),
  //       'idNumber': userData['customers']['id_number'].toString(),
  //       'nationality': userData['customers']['nationality'].toString(),
  //       'profession': userData['customers']['profession'].toString(),
  //       'is_host': userData['customers']['is_host'].toString(),
  //       'id': userData['id'].toString(),
  //       'type': 'onboard',
  //     };
  //     debugPrint("formated data is $formattedUserData");
  //     userActor.updateUser(UserModel.fromMap(formattedUserData));
  //
  //     userData = formattedUserData;
  //   }
  //
  //   return userData;
  // }


  /*
  * ######################################################
  * ############## Get user data #########################
  * ######################################################
  * */
  // Future<dynamic> updateCustomerDetails({
  //   required var id,
  //   required String firstname,
  //   required String lastname,
  //   required String othernames,
  //   required String address,
  //   required String profession,
  //   required String email,
  //   required String idType,
  //   required String idNumber,
  //   required String nationality,
  //   required String location
  // }) async {
  //   debugPrint("update user api being called");
  //   dynamic userData = await ApiHelperFunctions.updateProfile(id: id, firstname: firstname, lastname: lastname, othernames: othernames, address: address, profession: profession, email: email, idtype: idType, idnumber: idNumber, location: location, nationality: nationality);
  //   // debugPrint("user data to be fetched is $userData");
  //   if (userData != null) {
  //     debugPrint("customer user data fetched ${userData}");
  //
  //     // create a new map with the formatted date
  //     Map<String, dynamic> formattedUserData = {
  //       'firstName': userData['first_name'].toString(),
  //       'lastName': userData['last_name'].toString() == null ? userData['last_name'].toString() : '',
  //       'otherNames': userData['customers']['other_names'].toString() == null ? userData['customers']['other_names'].toString() : '',
  //       'mobileNumber': userData['customers']['mobile_number'].toString(),
  //       'email': userData['email'].toString(),
  //       'address': userData['customers']['address'].toString(),
  //       'idType': userData['customers']['id_type'].toString(),
  //       'idNumber': userData['customers']['id_number'].toString(),
  //       'nationality': userData['customers']['nationality'].toString(),
  //       'profession': userData['customers']['profession'].toString(),
  //       'is_host': userData['customers']['is_host'].toString(),
  //       'id': userData['id'].toString(),
  //       'type': 'onboard',
  //     };
  //     debugPrint("formated data is $formattedUserData");
  //     userActor.updateUser(UserModel.fromMap(formattedUserData));
  //
  //     userData = formattedUserData;
  //   }
  //
  //   return userData;
  // }


  // Future<dynamic> getEssentials() async {
  //   debugPrint("Essential being called");
  //   dynamic essentialData = await ApiHelperFunctions.getEssentials();
  //
  //
  //   serviceActors.serviceCategories.clear();
  //
  //   // debugPrint("user data to be fetched is $essentialData");
  //   if (essentialData != null) {
  //     // debugPrint("user data fetched $essentialData");
  //
  //     dynamic ServicesData = essentialData['Services'];
  //
  //     for(var serviceCat in ServicesData){
  //       // debugPrint("Service category is $serviceCat");
  //       serviceActors.addService(ServiceModel.fromJson(serviceCat));
  //     }
  //     // create a new map with the formatted date
  //
  //   }
  //
  //   return essentialData;
  // }

  /*
  * ######################################################
  * ############## Host a service #########################
  * ######################################################
  * */
  // Future<dynamic> hostAService({
  //   required String parentService,
  //   required String service_name,
  //   required String description,
  //   required String location,
  //   required List? process,
  //   required String duration,
  //   required String price,
  //   String? userid,
  //   List<XFile>? pictures,
  // }) async {
  //   debugPrint("Hosted service being called. Features are $process");
  //   dynamic hostedServiceData = await ApiHelperFunctions.hostService(userid: userid, pictures: pictures, parentService: parentService, service_name: service_name, description: description, location: location, process: process, duration: duration, price: price);
  //   debugPrint("Hosted service data is $hostedServiceData");
  //   if (hostedServiceData != null) {
  //     debugPrint("hosted service data $hostedServiceData");
  //
  //     // create a new map with the formatted date
  //     // Map<String, dynamic> formattedUserData = {
  //     //   'firstName': userData['first_name'].toString(),
  //     //   'lastName': userData['last_name'].toString(),
  //     //   'otherNames': userData['other_names'].toString(),
  //     //   'mobileNumber': userData['mobile_number'].toString(),
  //     //   'email': userData['email'].toString(),
  //     //   'address': userData['address'].toString(),
  //     //   'idType': userData['id_type'].toString(),
  //     //   'idNumber': userData['id_number'].toString(),
  //     //   'nationality': userData['nationality'].toString(),
  //     //   'profession': userData['profession'].toString(),
  //     // };
  //     // debugPrint("formated data is $formattedUserData");
  //     // userActor.updateUser(UserModel.fromMap(formattedUserData));
  //   }
  //
  //   return hostedServiceData[0];
  // }

  /*
  * ######################################################
  * ############## Get hosted services #########################
  * ######################################################
  * */

  // Future<dynamic> getHostedServices() async {
  //   debugPrint("Hosted service api being called");
  //   dynamic hostedServiceData = await ApiHelperFunctions.getHostedServices();
  //
  //
  //   hostedServiceActors.hostedServices.clear();
  //
  //   // debugPrint("user data to be fetched is $essentialData");
  //   if (hostedServiceData != null || hostedServiceData.isEmpty) {
  //     // debugPrint("Hosted service data fetched $hostedServiceData");
  //
  //     // dynamic ServicesData = essentialData['Services'];
  //
  //     for(var hostedService in hostedServiceData){
  //       debugPrint("Hosted Service is $hostedService");
  //       hostedServiceActors.addHostedService(HostedServiceModel.fromJson(hostedService));
  //     }
  //     // create a new map with the formatted date
  //
  //   }
  //
  //   return hostedServiceData;
  // }

  // Future<dynamic> getHostedServicesByCategory({
  //   required String serviceid,
  // }) async {
  //   debugPrint("Hosted service api being called");
  //   dynamic hostedServiceData = await ApiHelperFunctions.getHostedServicesByCategory(serviceid: serviceid);
  //
  //   hostedServiceActors.hostedServices.clear();
  //
  //   // debugPrint("user data to be fetched is $essentialData");
  //   if (hostedServiceData != null) {
  //     // debugPrint("Hosted service data fetched $hostedServiceData");
  //
  //     // dynamic ServicesData = essentialData['Services'];
  //
  //     for(var hostedService in hostedServiceData){
  //       debugPrint("Hosted service per category is $hostedService");
  //       hostedServiceActors.addHostedService(HostedServiceModel.fromJson(hostedService));
  //     }
  //     // create a new map with the formatted date
  //
  //   }
  //
  //   return hostedServiceData;
  // }

  // Future<dynamic> addServiceReview({
  //   required String hostedserviceid,
  //   required String review,
  //   required String userid,
  // }) async {
  //   // debugPrint("Draw api being called");
  //   dynamic hostedServiceReviewData = await ApiHelperFunctions.addServiceReview(userid: userid, hostedserviceid: hostedserviceid, review: review);
  //   debugPrint("Hosted service review data is $hostedServiceReviewData");
  //   if (hostedServiceReviewData != null) {
  //     // debugPrint("hosted service review data $hostedServiceReviewData");
  //     serviceReviewsActors.reviews.clear();
  //     // create a new map with the formatted date
  //     Map<String, dynamic> formattedData;
  //     List<ReviewModel> formattedFinalData = [];
  //
  //     if(hostedServiceReviewData!=null) {
  //       for (var review in hostedServiceReviewData['hosted_service_reviews']) {
  //         // debugPrint("Each review is $review");
  //         // debugPrint("Each review is ${review['service_review_id']}");
  //         DateTime dt1 = DateTime.parse(review['created_at']);
  //         DateTime dt2 = DateTime.now();
  //
  //         Duration diff = dt2.difference(dt1);
  //
  //         // debugPrint("Date difference is $diff");
  //         // debugPrint("Date difference is ${diff.inDays}");
  //         // debugPrint("Date difference is ${diff.inHours}");
  //         // debugPrint("Date difference is ${diff.inMinutes}}");
  //
  //         var convertedDate = diff.inDays!=0 ? "${diff.inDays} days ago" : diff.inHours!=0 ? "${diff.inHours} hours ago" : diff.inMinutes!=0 ? "${diff.inMinutes} mins ago" : "less than a minute ago";
  //
  //         formattedData = {
  //           'service_review_id': review['service_review_id']
  //               .toString(),
  //           'review': review['review'].toString(),
  //           'hosted_service_id': hostedServiceReviewData['hosted_service_id']
  //               .toString(),
  //           'hosted_service_name': hostedServiceReviewData['hosted_service_name']
  //               .toString(),
  //           'review_by_first_name': review['review_by']['customers']['first_name']
  //               .toString(),
  //           'review_by_last_name': review['review_by']['customers']['last_name']
  //               .toString(),
  //           'review_date': diff.toString()
  //         };
  //
  //         formattedFinalData.add(ReviewModel.fromMap(formattedData));
  //       }
  //       hostedServiceReviewData = formattedFinalData;
  //
  //       serviceReviewsActors.addReview(formattedFinalData);
  //     }
  //   }
  //
  //   return hostedServiceReviewData;
  // }

  /*
  * ######################################################
  * ############## Get service reviews #########################
  * ######################################################
  * */
  // Future<dynamic> getServiceReviews({required String serviceid}) async {
  //   // debugPrint("Get service review api being called");
  //   dynamic hostedServiceReviewData = await ApiHelperFunctions.getServiceReviews(serviceid: serviceid);
  //   // debugPrint("user data to be fetched is $userData");
  //   serviceReviewsActors.reviews.clear();
  //
  //
  //   Map<String, dynamic> formattedData;
  //   List<ReviewModel> formattedFinalData = [];
  //
  //   if(hostedServiceReviewData!=null) {
  //     for (var review in hostedServiceReviewData['hosted_service_reviews']) {
  //       // debugPrint("Each review is $review");
  //       // debugPrint("Review ID is ${review['service_review_id']}");
  //       // debugPrint("Review ID is ${review['review_by']['customers']}");
  //
  //       DateTime dt1 = DateTime.parse(review['created_at']);
  //       DateTime dt2 = DateTime.now();
  //
  //       Duration diff = dt2.difference(dt1);
  //
  //       debugPrint("Date difference is $diff");
  //       debugPrint("Date difference in days is ${diff.inDays}");
  //       debugPrint("Date difference in hours is ${diff.inHours}");
  //       debugPrint("Date difference in mins is ${diff.inMinutes}");
  //
  //       var convertedDate = diff.inDays!=0 ? "${diff.inDays} days ago" : diff.inHours!=0 ? "${diff.inHours} hours ago" : diff.inMinutes!=0 ? "${diff.inMinutes} mins ago" : "less than a minute ago";
  //       formattedData = {
  //         'service_review_id': review['service_review_id']
  //             .toString(),
  //         'review': review['review'].toString(),
  //         'hosted_service_id': hostedServiceReviewData['hosted_service_id']
  //             .toString(),
  //         'hosted_service_name': hostedServiceReviewData['hosted_service_name']
  //             .toString(),
  //         'review_by_first_name': review['review_by']['first_name']
  //             .toString(),
  //         'review_by_last_name': review['review_by']['last_name']
  //             .toString(),
  //         'review_date': convertedDate.toString()
  //       };
  //
  //       formattedFinalData.add(ReviewModel.fromMap(formattedData));
  //     }
  //     hostedServiceReviewData = formattedFinalData;
  //
  //     serviceReviewsActors.addReview(formattedFinalData);
  //   }
  //
  //   debugPrint("data returned is $hostedServiceReviewData");
  //
  //   return hostedServiceReviewData;
  // }
}