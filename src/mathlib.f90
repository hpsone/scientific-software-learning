module mathlib
        use iso_fortran_env, only: dp => real64
        use iso_c_binding, only: c_double, c_int 
        implicit none
        private
        public :: sum_of_squares, sum_of_squares_c
contains
        function sum_of_squares(x) result(y)
                real(dp), intent(in)    :: x(:) ! input
                real(dp)                :: y !output
                integer                 :: i
                y = 0.0_dp
                do i = 1, size(x)
                        y = y + x(i)**2
                end do
        end function sum_of_squares

        function sum_of_squares_c(n, v) result(y) bind(C, name="sum_of_squares_c")
               integer(c_int), value, intent(in)        :: n
               real(c_double), intent(in)               :: v(n)
               real(c_double)                           :: y
               y = sum_of_squares(v)
        end function sum_of_squares_c
end module mathlib
