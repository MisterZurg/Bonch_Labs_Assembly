#include <stdio.h>
extern int _sum(int re1,int im1,int re2,int im2);
int main(){
int re1,im1,re2,im2;
printf("¬ведите четыре целых числа и тупо чильте \n");
scanf("%d",&re1);
scanf("%d",&im1);
scanf("%d",&re2);
scanf("%d",&im2);
int result= _sum(re1,re2,im1,im2);
printf("’аха € уже знаю какое число ты загадал: %d ",result);
}
