// We have to include the following and this header file has to be included
// before match.h (by name), otherwise we get the following error:
//
// error: declaration of 'size_t' must be imported from module 'Darwin.C.stddef'
// before it is required

#include <stddef.h>