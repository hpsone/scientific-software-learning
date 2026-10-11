program main
        use mathlib
        use iso_fortran_env, only: dp => real64
        implicit none
        real(dp)        :: a(4)
        real(dp)        :: z, x
        x = 30.0_dp
        a = [1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp]
        z = sum_of_squares(a)
        print *, "Result : ", z
        if (abs(z - x) > 1.0e-12_dp) then
                error stop "mismatch"
        end if
end program main
