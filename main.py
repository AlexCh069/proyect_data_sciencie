import pandas as pd 
from utils import Utils


if __name__ == '__main__':

    utils = Utils()
    ruta_archivo_xlsx = "./in/04_Diccionario_Variables_ENL2022_1.xlsx"
    # Cargar el dataset original y seleccionar las columnas necesarias
    df = pd.read_csv("./in/V_ENL2022_300_400.csv",encoding='latin-1', dtype=str)

    
    # Cargar todas las hojas del archivo
    xls = pd.ExcelFile(ruta_archivo_xlsx)  

    # Crear un diccionario para almacenar la primera columna de cada hoja
    columnas_seleccionadas = []

    # Iterar sobre cada hoja
    for hoja in xls.sheet_names:
        # Leer la hoja actual
        df = pd.read_excel(xls, sheet_name=hoja)
        
        # Extraer la primera columna (asumiendo que siempre es la columna 0)
        primera_columna = list(df.iloc[:, 0].values)
        for col in primera_columna:
            columnas_seleccionadas.append(col)
            
    print(columnas_seleccionadas)
    # ----------------------------------------------------------------
    # Columnas a borrar
    delete_cols = list(set(df.columns) - set(columnas_seleccionadas))

    # borramos las columnas no requeridas
    df.drop(delete_cols, axis=1, inplace=True)
    df.drop('FACTOR200_FINAL', axis=1, inplace=True)

    