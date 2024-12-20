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

        # Filtramos elementos no vacíos
        elementos_validos = [x for x in valores if x.strip()]

        # Verificar si todos los elementos no vacíos son numéricos
        if all(x.replace('.', '', 1).isdigit() for x in elementos_validos):
            valores_modificados = [float(x) if '.' in x else int(x) for x in valores if x.strip()] + ["" for x in valores if not x.strip()]

            return pd.Series(valores_modificados)
        
        return data[name_col]