class PostTravelRequest {
  PostTravelRequest({
    required this.trek,
    required this.userId,
    required this.date,
    this.myContact,
    this.myEmail,
  });
  final String trek;
  final String userId;
  final String date;
  final String? myContact;
  final String? myEmail;
}
