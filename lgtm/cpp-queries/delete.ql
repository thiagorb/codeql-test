/**
 * @id cpp/codeql-test/delete
 * @name Deletion not managed by smart pointers
 * @description Types that should be managed by smart pointers should not be explicitly deleted.
 * @kind problem
 * @precision very-high
 * @problem.severity error
 * @tags reliability
 *       security
 */

import cpp
import predicates

from DeleteExpr deleteExpr, Class deletedClass
where 
    shouldBeManagedBySmartPointers(deletedClass)
    and
    deletedClass.refersTo(deleteExpr.getDeletedObjectType())
select deleteExpr, "The class " + deletedClass.getName() + " should be managed by smart pointers, therefore it should not be explicitly deleted"