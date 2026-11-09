
import pkg/autoconf_sugars/util
import pkg/autoconf_sugars/have_x_runtime

AC_CHECK_FUNCS(
  lstat,
  fstatat,
)

check_func_runtime fstatat, 10.10, 8.0
