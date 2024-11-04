#include <stdio.h>

int str_len2 (char *str)
{
    char *strptr;
    int len = 0;
    
    strptr = str;
    
    while(*strptr != '\0'){
        len++;
        strptr++;
    }
    return len;
}


int main (void)
{
    char string1[32];
    char string2[32];
    char *str1ptr;
    char *str2ptr;
    int tam1;
    int tam2;
    int iguais = 1;
    
    printf ("Entre com a string: \n");
    scanf("%s", string1);
    tam1 = str_len2(string1);
    
    printf ("Entre com a string: \n");
    scanf("%s", string2);
    tam2 = str_len2(string2);
    
    // ponto do inicio dos erros 
    if (tam1 == tam2) // if_1 externo
    {   
        printf ("Entrei no if 1 \n");
        str1ptr = string1;  // cachorra,0   cachorra,0
        str2ptr = string2;
        while ( *str1ptr != '\0' && 
                *str2ptr != '\0' && iguais )
        {
             printf ("*str1ptr = %c ; *str2ptr = %c \n", *str1ptr , *str2ptr);
             getchar();
             if (*str1ptr == *str2ptr ) // if_2
             {
                 printf ("Entrei no if 3: %x %x \n", str1ptr , str2ptr);
                 str1ptr++;
                 str2ptr++;
             }
             else {  // else_2
                 printf ("Encontrei caracter diferente.\n");
                 iguais = 0;
             }
        }
        
        
        if (iguais)  // if_2 interno 
          printf("As strings sao iguais\n");
        else  // else_2 interno
          printf("As strings sao diferentes 1\n");  
    }
    else { // else_1 externo
        printf("As strings sao diferentes 2\n");
    }
    return 0;
}