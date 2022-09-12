import 'package:flutter/cupertino.dart';
import 'package:gsheets/gsheets.dart';

import 'model.dart';

class UserSheetsApi{
  
  
static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "sheetflutterconn",
  "private_key_id": "0739995ff7479c3fc0d8f854dbfdb3f63ae373fc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD09JYSLS88s8HO\nNQtzHTmXeiZAGd0VQaC92cAhW8mGSnOMTVD4kx46oFzkE9i++hZVt5k+Q13519gJ\nCrmyB2BMF9LAqpntBPIc30Fjwp75omSkSS9wqIzDShDEGrMmFB05GJL/NAiSUZqt\ngmnwCWjXEUCZrMEZbQVpge96fLSKILK2WnSGpqCNQMNYnEjC2ZY9+zEiMFKdD+S1\nF7N+zXjgvhl+vmDjphNZa6fYF6msy58y2cnLwafuraMH1WiHVErcFD3FVRskeG7X\nyOZWBXsn3STvyFGB+TRdj2vsxMBCw5CsvtssP7qbfuNLyeWxvBKWJPDVJjofwOyY\nIk4SmEXLAgMBAAECggEAJBZQcZcUiXXWDIIGEMxyap2FOxZUWshTXQTSaFe0ZcNc\nKIRPdH+ACZUMelFuMhx34+LrgZ+9HYyt+A8Lcm3hwvQTiWzYxnFfFd/SK1dFwnMp\nLobVpVw/eJnVxH5GfEqkT4AOT+ijhqLdDcjTwJgySNTy1nD79bn4/SU2Wa47jsme\noZ5rUP5vYVQZQLMjcJroMeM0IrS8OYGHe3asjdPfEr7SCobRWl+/Mn0jnSROQwZm\nqpZAOubZuiqMYDeV/sg4TSIFlPwGgWx8H5QxrS+fWU1ol3YCq+5uDC+P7I504kzs\nPlqpFG9FT8rJcEgn4P45+nPd+KPMHexmf+OHnQL6gQKBgQD6nQLdpFMErY1scgWg\nmKpZ6BI6EEp/tCNOzH/Ui2JJGK/LL4l5KgfdC0UBTtAC+1b+8MEZ5GFZS2h386Ey\nimcCnWlrWEMgFKLPkXv4E6YqMqOXfzLV2nLmR2FolGA5Viqq0ufdyoKdxBuLwnTU\n/F5QqQCCKmAufUybtIMBCZqlwQKBgQD6OHFPeAkXrXE/z81M1AdjqZR9DSewON9o\ndmPZNdp4wp+Ia6kmKYi/HXzLVM8vE4roFkUNGWGCmzPQMUqpy3HTyFmP0iDed495\n4xmyibcy0AfyOdCiSbZ01buSjGDG25R0mVvDoU/TVz1XFXk6JadIoTwSfQPpLDzj\nj6Y1PK3GiwKBgQCiDK7StLO9vZ9J9TywSKc2dXp7sxcJFmkSReeOfwZxr5XUc4uY\nHlZxVx0qqFSW6QCq3vBuFp/gBoOptI6SSK4tIa4N7EeTUeSpBTC9C6+Rb6caifRM\nFfHf914EKpVB3fa++JtXbeAhtbH+ICI9qmYuD+m1QUNqLDlCIWnoXNZzwQKBgA/U\nVkbCv0CCNnHlAYXku/rwFXa7yFD7qBaBtttc7s9I8LK+rNq/Mel1QhnS6bB+ugDo\nt8GWY3bRvrtjAugu+Kp/ODtC/dVVFvyNA2kqES7jvjzyr2I065gElXM18kFiTsf5\nk7aSk+w4zqadsyecjjKoEJbS1daAd/GlesxPZGb1AoGBAJB6aPGeyogkxiUuljU4\n/8P8bgiQMvHFAwq+VNnC8tKEDYJA9Rx58imqA/HIwhqMEpIBNZyeXRjJvdunoyqs\n4FhQ239mKELcFTIFi6YmikzloFlL4bnSgnuiR9U+lq6ItktvH52ePmhvupXqxmRr\n+041eml0DH6Dasc4WND3mnxq\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheetsconn@sheetflutterconn.iam.gserviceaccount.com",
  "client_id": "118198821444387707301",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheetsconn%40sheetflutterconn.iam.gserviceaccount.com"
}


''';


static final   _spreadsheetId = '1zVMLIBSCV6Oj3NH2vVqYt2yXnP6yOT3VvpaSRg_TOs4';
static final gsheets = GSheets(_credentials);

static Worksheet? _userSheet;
  static Future init() async {
final ss = await gsheets.spreadsheet(_spreadsheetId);
var sheet =  ss.worksheetByTitle('example');
final cell = await sheet?.cells.cell(column: 2, row: 2);

 final spreadsheet = await gsheets.spreadsheet(_spreadsheetId);
_userSheet = await _getWorkSheet(spreadsheet, title: "Sayfa1");
return cell;
  }

  static Future<String?> getData()async{
    
    
final ss = await gsheets.spreadsheet(_spreadsheetId);
var sheet =  ss.worksheetByTitle('Sayfa1');
    final String cell = await sheet!.values.value(column: 2, row: 2);
    
  final spreadsheet = await gsheets.spreadsheet(_spreadsheetId);
_userSheet = await _getWorkSheet(spreadsheet, title: "Sayfa1");
    return cell.toString();
  }
static Future<User?> getUsers(int id)async{
   
  if (_userSheet == null) return null;
final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
return json == null ? null :User.fromJson(json);


}


  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
      required String title,
    }
  ) async
  
  {
    try{
    return await spreadsheet.addWorksheet(title);
  } catch (e) {
    return spreadsheet.worksheetByTitle(title)!;
}}
/* static Future<int> getRowCount() async{
  if (_userSheet == null) return 0;
  final lastRow = await _userSheet!.values.lastRow();

}
*/
}