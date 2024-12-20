import pandas as pd 
from utils import Utils
import numpy as np

# Función para identificar columnas con valores numéricos o vacíos
def is_numeric_or_empty(column):
    return all((value.strip().isdigit() or value.strip() == '') for value in column.dropna())

def convert_floats_to_ints(df):
    """
    Convierte todas las columnas de tipo float a tipo int en un DataFrame.
    Si hay valores NaN en las columnas float, los reemplaza con 0 antes de la conversión.
    """
    for col in df.select_dtypes(include=['float']).columns:
        # Rellenar NaN con 0 y convertir a int
        df[col] = df[col].fillna(0).astype(int)
    return df


if __name__ == '__main__':

    utils = Utils()
    ruta_xlsx = "./in/04_Diccionario_Variables_ENL2022_1.xlsx"
    ruta_csv = './in/V_ENL2022_300_400.csv'
    
    # Cargar todas las hojas del archivo
    xls = pd.ExcelFile(ruta_xlsx)  

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
            
    # ----------------------------------------------------------------
    # Cargar el dataset original y seleccionar las columnas necesarias
    df = pd.read_csv(ruta_csv,encoding='latin-1', dtype=str)

    # columnas a borrar
    delete_cols = list(set(df.columns) - set(columnas_seleccionadas))

    # borramos las columnas no requeridas
    df.drop(delete_cols, axis=1, inplace=True)
    df.drop('FACTOR200_FINAL', axis=1, inplace=True)

    # ----------------------------------------------------------------
    # Modificacion de datos str a numericos
    # Procesar cada columna
    for col in df.columns:
        if is_numeric_or_empty(df[col]):
            # Convertir a numérico, manejando valores vacíos como NaN y luego reemplazarlos por 0
            df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
        else:
            # Asegurar que las cadenas con ceros iniciales permanezcan como están
            df[col] = df[col].astype(str)

    df = convert_floats_to_ints(df)


    # Verificar el resultado
    print(df.info())

    df.to_csv('./out/data_modificada.csv')
        