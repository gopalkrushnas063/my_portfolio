import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

TableRow _buildTableRow(BuildContext context, String label, String value) {
  return TableRow(
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              _handleTap(context, label, value);
            },
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ),
        ),
      ),
    ],
  );
}

void _handleTap(BuildContext context, String label, String value) {
  switch (label) {
    case "GitHub":
      _launchURL(value);
      break;
    case "Phone":
      _launchPhone(value);
      break;
    case "Email":
      _launchEmail(value);
      break;
    case "Website":
      _launchURL(value);
      break;
    // Add more cases as needed
    default:
      break;
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchPhone(String phoneNumber) async {
  final String url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchEmail(String email) async {
  final String url = 'mailto:$email';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
