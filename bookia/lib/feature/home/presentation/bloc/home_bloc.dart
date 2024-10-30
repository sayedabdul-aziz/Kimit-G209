import 'package:bookia/feature/home/data/models/products_response/products_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetNewArrivalsBooksEvent>(getNewArrivals);
  }

  ProductsResponse? productsResponse;
  Future<void> getNewArrivals(
      GetNewArrivalsBooksEvent event, Emitter<HomeState> emit) async {
    // login logic
    emit(GetNewArrivalsBooksLoadingState());
    await HomeRepo.getNewArrivalsBooks().then((value) {
      if (value != null) {
        productsResponse = value;
        emit(GetNewArrivalsBooksSuccessState());
      } else {
        emit(HomeErrorState());
      }
    });
  }
}
