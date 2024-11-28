import pandas as pd

class Utils:
    def __init__(self):
        self.var = None

    def mod_col(self, data:pd.DataFrame, name_col):

        # Si es int64 no modificamos nada
        if data[name_col].dtype == 'int64':
            return data[name_col]

        # Si es string y contiene un numero, lo pasamos a int

        valores = list(data[name_col].values)
        valores_modificados = []

        for val in valores:
            if type(val) == 'int64':
                valores_modificados.append(val)

            else:
                # Si es un string que contiene un numero, lo pasamos a int
                try:
                    valores_modificados.append(int(val))
                except ValueError:
                    # Si no es un numero, lo dejamos como esta
                    valores_modificados.append(None)
        
        return pd.Series(valores_modificados)
       