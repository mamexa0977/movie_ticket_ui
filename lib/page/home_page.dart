import 'package:carousel_slider/carousel_slider.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/movies.dart';
import 'package:todo_app/widget/background_widget.dart';
import 'package:todo_app/widget/buy_button_widget.dart';
import 'package:todo_app/widget/movie_card_widget.dart';

class HomePage extends StatelessWidget {
  final controller = PageController();
  

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.close),
          actions: [Icon(Icons.person_outline), SizedBox(width: 15)],
        ),
        body: Stack(
          children: [
            BackgroundWidget(
              controller: controller,
              
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider(
                    items:
                        movies.map((e) => MovieCardWidget(movie: e,)).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.75,
                      height: MediaQuery.of(context).size.height * 0.7,
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) => controller.animateToPage(
                        index,
                        duration: Duration(seconds: 1),
                        curve: Curves.ease,
                      ),
                    ),
                  ),
                  BuyButtonWidget(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
}
