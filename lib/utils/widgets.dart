import 'package:flutter/material.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(children: [
        Icon(Icons.arrow_back_ios_new_rounded,
            color: Themes().blackColor, size: 15),
        const SizedBox(
          width: 5,
        ),
        Text(
          Strings.back,
          style: TextStyles()
              .blackTextStyle400()
              .copyWith(fontWeight: FontWeight.w600),
        )
      ]),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

AppBar buildAppBar2(BuildContext context, String title, bool search, ) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      
      child: 
        Icon(Icons.arrow_back_rounded,
            color: Themes().blackColor, size: 17,)
    ),
 
    actions: [search ? GestureDetector(child: Icon(Icons.search_rounded,color: Themes().tetiaryColor,),) : Container()],
    title: Text(title, style: GoogleFonts.inter(
      color: Themes().blackColor,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    )),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: Themes().primaryColor,
                textStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                text,
                style:
                    TextStyles().defaultText(16, FontWeight.w500, Colors.white),
              ),
            ),
          ),
        ],
      );
}

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                textStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(width: 2, color: Themes().greenColor)),
              ),
              child: Text(
                text,
                style: TextStyles()
                    .defaultText(15, FontWeight.w500, Themes().blackColor),
              ),
            ),
          ),
        ],
      );
}

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    this.label,
    this.controller,
    this.color,
    this.hintText,
    this.prefixIcon,
    super.key,
  });
  final String? label;
  final TextEditingController? controller;
  final Color? color;
  final String? hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toString(),
          style: TextStyles().blackTextStyle(14, FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: color ?? Themes().seaShellColor,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyles().greyTextStyle400(),
              prefixIcon: prefixIcon,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  const OtpInput(this.controller, this.autoFocus, this.textInputAction,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          color: Themes().seaShellColor,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: TextField(
        textInputAction: textInputAction,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}


class OrderItem extends StatelessWidget {
  OrderItem({
    required this.isCancelled,
    super.key,
  });
  bool isCancelled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.only(bottom: 12, top: 8, left: 10, right: 15),
         margin: EdgeInsets.only(bottom: 15),
                
              decoration: BoxDecoration(

                  color: Themes().whiteBackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Image.asset(
                Strings.imgPizza,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Pizza Toast Pizzarela',
                    style: TextStyles().black17TextStyle600()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '4 items',
                    style: TextStyles().blackTextStyle500(),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '|',
                    style: TextStyles().blackTextStyle500(),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '45 km',
                    style: TextStyles().blackTextStyle500(),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$ 20.00',
                    style: TextStyles().orangeTextStyle600(),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 28,
                    width: 100,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Themes().primaryColor,width: 2),
                        color: isCancelled
                            ? Themes().whiteBackgroundColor
                            : Themes().primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: isCancelled
                          ? 
                    Text(
                      
                      Strings.cancelled,
                      style: TextStyles().orangeTextStyle400()
                         
                    ):
                    Text(
                      Strings.orderAgain,
                      style:  TextStyles().whiteTextStyle500(),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}