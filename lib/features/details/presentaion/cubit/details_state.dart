abstract class DetailsStates{}

class DetailsInitial extends DetailsStates{}
class LoadingGetProductDetailsState extends DetailsStates{}
class SuccessGetProductDetailsState extends DetailsStates{}
class ErrorGetProductDetailsState extends DetailsStates{}