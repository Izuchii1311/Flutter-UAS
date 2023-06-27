class API {
  static const hostConnect = "http://192.168.43.27:8080/api_clothes_store";

  // User
  static const hostConnectUser = "$hostConnect/user";
  static const registrasi = "$hostConnect/user/signup.php";
  static const login = "$hostConnect/user/login.php";
  static const validasiEmail = "$hostConnect/user/validate_email.php";

  // Post
  static const list = "$hostConnect/post/list.php";
  static const createPost = "$hostConnect/post/create.php";
  static const detailPost = "$hostConnect/detail.php";
  static const updatePost = "$hostConnect/update.php";
  static const deletePost = "$hostConnect/delete.php";

}
