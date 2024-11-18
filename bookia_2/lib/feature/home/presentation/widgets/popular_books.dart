import 'package:bookia_2/core/utils/colors.dart';
import 'package:bookia_2/core/utils/text_style.dart';
import 'package:bookia_2/core/widgets/custom_button.dart';
import 'package:bookia_2/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_2/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_2/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularBooks extends StatefulWidget {
  const PopularBooks({
    super.key,
  });

  @override
  State<PopularBooks> createState() => _PopularBooksState();
}

class _PopularBooksState extends State<PopularBooks> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetNewArrivalsBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var books = context.read<HomeBloc>().productsResponse?.data?.products;
        return Skeletonizer(
          enabled: state is! GetNewArrivalsBooksSuccessState,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 280),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        books?[index].image ?? '',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )),
                    const Gap(10),
                    Text(
                      books?[index].name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyTextStyle(context, fontSize: 14),
                    ),
                    const Gap(10),
                    Row(children: [
                      Text('${books?[index].priceAfterDiscount} EGP'),
                      const Spacer(),
                      CustomButton(
                          radius: 5,
                          width: 80,
                          height: 28,
                          text: 'Buy',
                          color: AppColors.darkColor,
                          onTap: () {})
                    ])
                  ],
                ),
              );
            },
            itemCount: books?.length,
          ),
        );
      },
    );
  }
}
