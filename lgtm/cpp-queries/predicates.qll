import cpp

predicate isAssignableTo(Class c, string parent) {
    c.getABaseClass*().hasName(parent)
}
  
predicate shouldBeManagedBySmartPointers(Class c) {
    isAssignableTo(c, "WIDGET")
    or
    isAssignableTo(c, "W_SCREEN")
}