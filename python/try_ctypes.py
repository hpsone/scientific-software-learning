import ctypes
libc = ctypes.CDLL("build-debug/libmathlib.dylib")
arr = (ctypes.c_double * 4) (1.0, 2.0, 3.0, 4.0)
libc.sum_of_squares_c.restype = ctypes.c_double
print(libc.sum_of_squares_c(4,arr)) 
