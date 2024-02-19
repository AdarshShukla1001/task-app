abstract class UseCase<Input,Output>{
  
  Output call({required Input input});

}


abstract class AsyncUseCase<Input,Output>{

  Future<Output> call ({required Input input});
}