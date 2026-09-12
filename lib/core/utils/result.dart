sealed class Result<T>{
 const Result();
  factory Result.success(T data) = Success<T>;
  factory Result.error(String message) = Error<T>;
}
  class Success<T> extends Result<T>{
    const Success(this.data );
    final T data ; 
   
  }

  class Error<T>extends Result<T>{
    const Error(this.message);
    final String message ; 
  }
