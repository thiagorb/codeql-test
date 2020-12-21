/**
 * @id cpp/codeql-test/new
 * @name Allocation not managed by smart pointers
 * @description Types that should be managed by smart pointers should be instantiated with smart pointer constructors.
 * @kind problem
 * @precision very-high
 * @problem.severity error
 */

import cpp
import predicates

from NewExpr newExpr, FunctionCall parentCall, Class allocatedClass
where 
    shouldBeManagedBySmartPointers(allocatedClass)
    and
    allocatedClass.refersTo(newExpr.getAllocatedType())
    and
    (
        not newExpr.getParent() instanceof FunctionCall
        or
        (
            parentCall = newExpr.getParent()
            and 
            not parentCall.getTarget().getQualifiedName().regexpMatch(
                "^(std::shared_ptr<.*>::shared_ptr|std::unique_ptr<.*>::unique_ptr)$"
            )
        )
    )
select newExpr, "The class " + allocatedClass.getName() + " should be managed by smart pointers, therefore it should only be allocated with smart pointer constructors"