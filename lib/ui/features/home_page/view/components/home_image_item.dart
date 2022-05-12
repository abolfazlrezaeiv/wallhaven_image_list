import 'package:abolfazl_flutter_testtask/constants/message/app_messages.dart';
import 'package:abolfazl_flutter_testtask/constants/padding/app_paddings.dart';
import 'package:abolfazl_flutter_testtask/constants/size/app_size.dart';
import 'package:flutter/material.dart';

class HomeImageItem extends StatelessWidget {
  const HomeImageItem({
    Key? key,
    required this.url,
    required this.onNavigateButtonTapped,
  }) : super(key: key);

  final Function()? onNavigateButtonTapped;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.a20,
      child: Container(
        color: Colors.black54,
        child: Padding(
          padding: AppPadding.a20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
                height: AppSize.s150,
                width: AppSize.s200,
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: onNavigateButtonTapped,
                child: const Text(AppMessage.homePageDetailButtonTitle),
              )
            ],
          ),
        ),
      ),
    );
  }
}
