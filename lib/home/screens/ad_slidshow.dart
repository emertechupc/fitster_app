import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class AdSlideshow extends StatelessWidget {
  final List<String> ads;

  const AdSlideshow({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0.0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.background,
            color: colors.onSecondary
          ),
        ),
        itemCount: ads.length,
        itemBuilder: (context, index) => _Slide(ad: ads[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String ad;

  const _Slide({required this.ad});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10.0,
            offset: Offset(0, 10),
          )
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            ad,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
