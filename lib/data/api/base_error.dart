class BaseError{
  String errorMessage ;
  BaseError({required this.errorMessage});
}

class ServerError extends BaseError{
  ServerError({required super.errorMessage});

}