import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final void Function() onTap;
  final IconData? icon;
  final String title;
  final String imageUrl;
  final Color? tralingColor;
  final Color? textColor;
  final Color? iconColor;
  final bool arrowIcon;
  final bool image;

  const ListTileWidget({
    super.key,
    required this.onTap,
    this.icon,
    this.tralingColor,
    this.arrowIcon = true, required this.title, this.textColor, this.iconColor, this.image= false,  this.imageUrl="",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: onTap,
        minLeadingWidth: 8,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
        dense: true,
        leading :Icon(
          icon,
          size: 26,
          color:iconColor?? Colors.black,
        ),
        title: Text(
          title,
         style: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.w500,
           color:textColor?? Colors.black,
         ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color:tralingColor?? Colors.black,
          size: 16,
        ),

      ),
    );
  }
}
