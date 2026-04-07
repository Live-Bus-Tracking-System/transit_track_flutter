String exception(int? statusCode) {
  if (statusCode == null) {
    return 'No response from server';
  }

  switch (statusCode) {
    case 200:
      return 'Success';
    case 201:
      return 'Successfully created';
    case 400:
      return 'Invalid request. Please check your input';
    case 401:
      return 'Invalid email or password';
    case 404:
      return 'Data not found';
    case 500:
      return 'Server error. Try again later';
    case 504:
      return 'Server timeout. Please try again';
    default:
      return 'Something went wrong';
  }
}
