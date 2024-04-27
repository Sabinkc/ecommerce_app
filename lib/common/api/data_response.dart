class DataResponse<Type>{
  final bool status;
  final Type? data;
  final String message;

  DataResponse({
    required this.status, 
     this.data, 
    required this.message,
    });

    factory DataResponse.errror(String message){
      return DataResponse(status: false, message: message);
    }

    factory DataResponse.success(Type data){
      return DataResponse(status: true, message: "", data: data,);
    }
}