import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/setting/view_model/setting_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import 'package:auto_route/auto_route.dart';

class ShowDialogLogOut extends StatelessWidget {
  final Size size;

  const ShowDialogLogOut({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.grey.withOpacity(0.1),
      actions: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "خروج",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: titleColor1,
                    fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
              ),
              SizedBox(height: size.height*0.05>20?20:size.height*0.05,),

              Consumer(builder: (context,ref,widget){
                var viewModel=ref.watch(settingViewModelProvider);
                return Row(
                  children: [
                    Expanded(child: Container(height: size.height*0.06>60?60:size.height*0.06,child: CustomButton(title: "انصراف",backgroundColor: Colors.transparent,titleColor: textColorGrey1,
                    onTap: (){
                      if(viewModel.isLoadingLogOut)return;
                      context.router.pop();
                    },))),

                    SizedBox(width: size.width*0.05,),
                    Expanded(child: Container(height: size.height*0.06>60?60:size.height*0.06,child: CustomButton(title: "خروج",isLoading: viewModel.isLoadingLogOut,onTap: (){
                      if(viewModel.isLoadingLogOut)return;

                      viewModel.callApiToLogOut(context, ref);

                    },))),
                  ],
                );
              })
              
              
            ],
          ),
        )
      ],
    );
  }
}
