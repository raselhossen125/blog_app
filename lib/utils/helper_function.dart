import 'package:flutter/src/painting/text_style.dart';
import 'package:intl/intl.dart';

String getFormatedDateTime(DateTime dateTime, String patern) =>
    DateFormat(patern).format(dateTime);