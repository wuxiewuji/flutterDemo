///MVP 顶级类



abstract class IView<T> {
  setPresenter(T presenter);
}

abstract class IPresenter{

  init();
}
