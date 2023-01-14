abstract class PagesEvent{}

class ChangePageEvent implements PagesEvent{
  final int page;

  ChangePageEvent(this.page);
}