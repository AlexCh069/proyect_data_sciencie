import pandas as pd 
from utils import Utils


if __name__ == '__main__':

    utils = Utils()


    # importamos la data
    data = pd.read_csv('./in/V_ENL2022_300_400.csv', encoding='latin-1')

    # ----------------------------------------------------------------
    # columnas a eliminar
    delete_cols = ['CONG','NSELV','HOGAR','TOT_HOGAR','PERS_NRO','P201','VIVIENDA','PER','P203',
               'P206','P207','P208','PERS_300','INF_300','P306_G','P309','P310_N','P310_A','P310_G','P310_C',
               'P311','P312_1','P312_2','P312_3','P312_4','P312_5','P312_6','P312_7_8','P313',
               'PERS_400','INF_400','P407_1','P407_2','P407_3','P407_4','P408','P409','RESFIN','RESFIN_V','FACTOR200_FINAL']

    data.drop(delete_cols, axis=1, inplace=True)    # eliminamos las columnas
    
    # ----------------------------------------------------------------
    # columnas filtradas para manipulacion de datos a datos enteros
    columnas = data.columns
    # Filtrar columnas que comienzan con 'P2', 'P3' Y 'P4'
    filtrados = [col for col in columnas if col.startswith(('P2', 'P3','P4'))]
    #print("columnas filtrados:", filtrados)
    
    # ----------------------------------------------------------------

    # Creamos un nuevo dataframe para almacenar cambios (solo si disponemos de la memoria sufuciente)
    new_df = pd.DataFrame()
    cols_enl = list(set(data.columns) - set(filtrados))

    for col in cols_enl:
        new_df[col] = pd.Series(data[col])

    # ----------------------------------------------------------------
    # Modificando los datos de las columnas filtradas PXXX

    for col in filtrados:
        new_df[col] = utils.mod_col(data,col)
    
    print(new_df.head(3))

    new_df.to_csv('./out/data_modificada.csv')