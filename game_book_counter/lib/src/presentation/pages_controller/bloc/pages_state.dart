abstract class PagesState{}

class FirstPageState implements PagesState{}

class SecondPageState implements PagesState{}

class ThirdPageState implements PagesState{}

class PageExceptionState implements PagesState{
  final String error;

  PageExceptionState(this.error);
}