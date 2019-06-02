#include "libRed/red.h"
int main() {
redOpen();
//redDo("view [text {Hello World!}]");
red_value res=redDo("1 + 2");
redPrint(res);
redClose();
return 0;
}