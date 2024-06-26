import 'package:intl/intl.dart';

class FechaUtils {
  static String getFormatoFecha(
      {required DateTime fecha, bool conHora = true, dynamic tipo = 1}) {
    String fechaMask;
    String fechaFormat;
    switch (tipo) {
      // 01/01
      case 2:
        fechaMask = 'MM/dd';
        break;
      // Ene/01
      case 3:
        fechaMask = 'MMM/dd';
        break;
      // DD
      case 'dia':
        fechaMask = 'dd';
        break;
      // MM
      case 'mes':
        fechaMask = 'MM';
        break;
      // YYYY
      case 'anio':
        fechaMask = 'YYYY';
        break;
      // 01/01/0000
      default:
        fechaMask = 'dd/MM/yyyy';
    }
    if (conHora) {
      fechaFormat = DateFormat('$fechaMask hh:mm').format(fecha);
    } else {
      fechaFormat = DateFormat(fechaMask).format(fecha);
    }
    return fechaFormat;
  }

  static DateTime parseFecha({
    required String fechaStr,
    String mask = 'yyyy-MM-dd HH:mm:ss.SSS',
  }) {
    return DateFormat(mask).parse(fechaStr);
  }
}
