discard """
  targets: c js
"""

import std/unittest
import std/os

import pyosstat
import pkg/pystat
suite "os.stat":
  test "exceptions":
    expect OSError:
      let _ = stat "<<<not exists>>/!>"
suite "os.stat_result":
  test ".st_mode":
    let st = stat currentSourcePath()
    check S_ISREG st.st_mode

    let dst = stat currentSourcePath().parentDir
    check S_ISDIR dst.st_mode

  test "getitem":
    let st = stat currentSourcePath()
    check st.st_ino.BiggestInt == st[0]
    check st.st_ino.BiggestInt == st[-10]

