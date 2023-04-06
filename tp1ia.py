import joblib
import numpy as np
import os

model= joblib.load('nomdumodele.joblib') #l'utilisateur devra saisir le nom du fichier joblib associé

input = [100,4 ,1 ] #saisir les paramètres désirés (taille maison, nb-chambres, jardin) 
lenght = len(input)


def coef(model):  #pour avoir les coefficient de ton modèle joblib
    coef = [model.intercept_] + [coef for coef in model.coef_]
    return (coef)
    
def script (code_c): #pour écire dans un fichier le code c
    fileC = open('tpiamaison.c', 'w')
    fileC.write(code_c)
    fileC.close()
    
def generate_code_c(model):
    coef = coef(model)
    
    code_c = f"""
        #include <stdio.h>
        #include <stdlib.h>
        float linear_reg(float* input, int lenght){{
        
            float coef[] = {{{', ', .join(str(c) for c in coef)}}}; /*pour avoir un tableau bien en C avec les coefs calculés avant dans la fonction coef
        
        
            float prediction = coef[0]; /*car le début de la regression lineaire est X0 tout seul 
            
            for (int i = 0; i<lenght; i++){{
        
                    prediction = prediction + input[i] * coef[i+1];    /*... + X1 input1 + X2 input2
            }}
        
            return (prediction);
        
        }}
        
        int main() {{
        
            float input [{n_param}] = {{{','.join(str(i) for i in input)}}};
            int lenght  = sizeof(input)/sizeof(float);
            
            
            float p = linear_reg(input, lenght);
            printf("%f", p);
            return 0;
        }}
    
    """
    
    script(code_c)
    

#fin de la fonction code_c
    
generate_code_c(model)

pred = model.predict(np.array(features).reshape(1, -1))
print("\n prix prédit :" + str(pred)) #pour vérifier que prix prédit en C est le même que en python.
