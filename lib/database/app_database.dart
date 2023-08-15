// import 'package:postgres/postgres.dart';
//
// class AppDatabase {
//   String mobileValue = '';
//   String passwordValue = '';
//
//   PostgreSQLConnection? connection;
//   PostgreSQLResult? loginResult;
//
//   AppDatabase() {
//     connection = (connection == null || connection!.isClosed == true
//         ? PostgreSQLConnection(
//         // for external device like mobile phone use domain.com or
//         // your computer machine IP address (i.e,192.168.0.1,etc)
//         // when using AVD add this IP 10.0.2.2
//         '10.0.2.2',
//         5432,
//         'flutterdb',
//         username: 'flutterdb_admin',
//         password: '123456',
//         timeoutInSeconds: 30,
//         queryTimeoutInSeconds: 30,
//         timeZone: 'UTC',
//         useSSL: false,
//         isUnixSocket: false,
//       ) : connection
//     );
//   }
//
//   //Login Database Section
//   String userLoginFuture = '';
//   Future<String> loginUser(String email, String password) async {
//     try {
//       await connection!.open();
//       await connection!.transaction((loginConn) async {
//         //Step 1 : Check email registered or no
//         loginResult = await loginConn.query(
//           'select emailDB,passDB from myAppData.register where emailDB = @emailValue order by idDB',
//           substitutionValues: {'emailValue': email},
//           allowReuse: true,
//           timeoutInSeconds: 30,
//         );
//         if (loginResult!.affectedRowCount > 0) {
//           // Usually we check if account expired or no ...but I will
//           // not add the code and skip here to simplify things
//           // We will check the entered credentials..and decide
//           // weather the user is a buyer or seller
//
//           sellerEmailAddress = loginResult!.first
//               .elementAt(0); //This to use when update seller details
//
//           if (loginResult!.first.elementAt(1).contains(password) == true &&
//               loginResult!.first.elementAt(2) == true) {
//             userLoginFuture = 'sel';
//           } else if (loginResult!.first.elementAt(1).contains(password) ==
//               true &&
//               loginResult!.first.elementAt(2) == false) {
//             userLoginFuture = 'buy';
//           } else if (loginResult!.first.elementAt(1).contains(password) ==
//               false) {
//             userLoginFuture = 'fai';
//           } else {
//             userLoginFuture = 'exc';
//           }
//         } else {
//           userLoginFuture = 'not';
//         }
//       });
//     } catch (exc) {
//       userLoginFuture = 'exc';
//       exc.toString();
//     }
//     return userLoginFuture;
//   }
//
// }