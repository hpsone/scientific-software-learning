import ctypes
from pathlib import Path
import numpy as np
ROOT = Path(__file__).resolve().parent.parent
LIB_PATH = ROOT / "build-debug" / "libmathlib.dylib"
lib = ctypes.CDLL(str(LIB_PATH))
lib.sum_of_squares_c.restype = ctypes.c_double
lib.sum_of_squares_c.argtypes = [ctypes.c_int, ctypes.POINTER(ctypes.c_double)]

def test_sum_of_squares_matches_numpy():
    x = np.array([1.0, 2.0, 3.0, 4.0], dtype=np.float64)
    n = len(x)
    ptr = x.ctypes.data_as(ctypes.POINTER(ctypes.c_double))
    result = lib.sum_of_squares_c(n, ptr)
    expected = np.sum(x ** 2)  
    np.testing.assert_allclose(result, expected)

