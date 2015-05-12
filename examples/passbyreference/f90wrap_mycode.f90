! Module mymodule defined in file mycode.F90

subroutine f90wrap_mytype__get__val(this, val)
    use mymodule, only: mytype
    implicit none
    type mytype_ptr_type
        type(mytype), pointer :: p => NULL()
    end type mytype_ptr_type
    integer, intent(in)   :: this(2)
    type(mytype_ptr_type) :: this_ptr
    double precision, intent(out) :: val
    
    this_ptr = transfer(this, this_ptr)
    val = this_ptr%p%val
end subroutine f90wrap_mytype__get__val

subroutine f90wrap_mytype__set__val(this, val)
    use mymodule, only: mytype
    implicit none
    type mytype_ptr_type
        type(mytype), pointer :: p => NULL()
    end type mytype_ptr_type
    integer, intent(in)   :: this(2)
    type(mytype_ptr_type) :: this_ptr
    double precision, intent(in) :: val
    
    this_ptr = transfer(this, this_ptr)
    this_ptr%p%val = val
end subroutine f90wrap_mytype__set__val

subroutine f90wrap_mytype_initialise(this)
    use mymodule, only: mytype
    implicit none
    
    type mytype_ptr_type
        type(mytype), pointer :: p => NULL()
    end type mytype_ptr_type
    type(mytype_ptr_type) :: this_ptr
    integer, intent(out), dimension(2) :: this
    allocate(this_ptr%p)
    this = transfer(this_ptr, this)
end subroutine f90wrap_mytype_initialise

subroutine f90wrap_mytype_finalise(this)
    use mymodule, only: mytype
    implicit none
    
    type mytype_ptr_type
        type(mytype), pointer :: p => NULL()
    end type mytype_ptr_type
    type(mytype_ptr_type) :: this_ptr
    integer, intent(in), dimension(2) :: this
    this_ptr = transfer(this, this_ptr)
    deallocate(this_ptr%p)
end subroutine f90wrap_mytype_finalise

subroutine f90wrap_mysubroutine(a, b, tt)
    use mymodule, only: mysubroutine, mytype
    implicit none
    
    type mytype_ptr_type
        type(mytype), pointer :: p => NULL()
    end type mytype_ptr_type
    double precision :: a
    double precision :: b
    type(mytype_ptr_type) :: tt_ptr
    integer, intent(in), dimension(2) :: tt
    tt_ptr = transfer(tt, tt_ptr)
    call mysubroutine(a=a, b=b, tt=tt_ptr%p)
end subroutine f90wrap_mysubroutine

! End of module mymodule defined in file mycode.F90

