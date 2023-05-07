String? nonEmptyValidator(text) {
  if (text?.isEmpty ?? true) {
    return "This field shouldn't be empty";
  }
  return null;
}
