class Course{
  String name;
  String code;
  int section;
  String _faculty;
  Course( { this.name = "", this.code = "" , this.section = 0, String faculty = "" } ) : _faculty = faculty;

  String get faculty => _faculty;
  set faculty(String value) {
    _faculty = value.toUpperCase();
  }
// TODO: write test so that faculty initials is always set to upper case, maybe remove number or special characters from faculty initials?
}