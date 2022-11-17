enum OTPMethod{
  mail,
  sms;

  @override
  String toString(){
 if(this == OTPMethod.mail){
  return "Email";
 }else{
  return "SMS";
 }
  }
}