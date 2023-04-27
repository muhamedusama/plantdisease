abstract class modelstates {

}
class modelinitialstate extends modelstates{

}
class modelImagePickedSuccessState extends modelstates {

}
class modelImagePickedErrorState extends modelstates {

}

class modelpredictedsuccessfully extends modelstates{

}
class modelloading extends modelstates{

}
class GetUserLoadingState extends modelstates{

}
class GetUserSuccessState extends modelstates{

}
class GetUserErrorState extends modelstates{
final String error;
GetUserErrorState(this.error);
}

