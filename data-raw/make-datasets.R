library(tidyverse)
library(stringr)
library(readxl)
library(readr)
library(here)
library(personal.pjp)
library(usethis)

#' (2018-01-23)-----------------------------------------------------

## Fichero INE con los códigos de las provincias y CCAA
cod_provincias <- read_excel(paste0(here(), "./data-raw/INE_municipios/cod_provincias.xlsx"))
cod_provincias <- cod_provincias %>% map(str_trim, side = "both") %>% as.tibble() #- quita caracteres al final y al ppio data.frame(lapply(eur_tot, trimws)) #
aa <- names_v_df_pjp(cod_provincias) #- ok, todo character
# devtools::use_data(cod_provincias) #- lo guargo
# use_data(cod_provincias) #- lo guarde con esta linea que usa el pkg usethis el 2018-01-23

## fichero del INE con los municipios a 1-enero-2017
cod_municipios_17 <- read_excel(paste0(here(), "./data-raw/INE_municipios/cod_municipios_2017.xlsx"), skip = 1, sheet = "dic17")
cod_municipios_17 <- cod_municipios_17 %>% map(str_trim, side = "both") %>% as.tibble() #- quita caracteres al final y al ppio data.frame(lapply(eur_tot, trimws)) #
aa <- names_v_df_pjp(cod_municipios_17) #- ok, todo character
# devtools::use_data(cod_municipios_17) #- lo guargo
# use_data(cod_municipios_17) #- lo guarde con esta linea que usa el pkg usethis el 2018-01-23


## fichero del INE con los municipios a 1-enero-2016
cod_municipios_16 <- read_excel(paste0(here(), "./data-raw/INE_municipios/cod_municipios_2017.xlsx"), skip = 1, sheet = "dic16")
cod_municipios_16 <- cod_municipios_16 %>% map(str_trim, side = "both") %>% as.tibble() #- quita caracteres al final y al ppio data.frame(lapply(eur_tot, trimws)) #
aa <- names_v_df_pjp(cod_municipios_16) #- ok, todo character
# devtools::use_data(cod_municipios_16) #- lo guargo
# use_data(cod_municipios_16) #- lo guarde con esta linea que usa el pkg usethis el 2018-01-23



## Voy a fusionar cod_municipios_17 con cod_provincias
## Primero creo el codigo mas habitual en INE: INECodMuni
cod_municipios_17 <- cod_municipios_17 %>% mutate(INECodMuni = paste0(CPRO, CMUN)) #- Hay 8124 municipios.
cod_provincias <- cod_provincias %>% select(-CODAUTO) #- la quito xq sino se duplicaria
#- el fichero lo llamo cod_INE_muni_pjp
cod_muni_pjp_17 <-  left_join(cod_municipios_17, cod_provincias, by = "CPRO")
aa <- names_v_df_pjp(cod_muni_pjp_17) #- ok, todo character
#- renombro las primeras columnas para hacerlas compatibles con "municipios_CNIG"
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% rename(NombreMuni = NOMBRE)
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% rename(NombreProv = PROVINCIA)
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% rename(NombreCCAA = CCAA)
#- cambio nombre de las series de cogigos, la de los municipios ya esta hecha (INECodMuni)
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% rename(INECodProv = CPRO)
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% rename(INECodCCAA = CODAUTO)
#- Creo version numerica de los codigos INE de CCAA, prov y municipios
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% mutate(INENumMuni = as.integer(INECodMuni))
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% mutate(INENumProv = as.integer(INECodProv))
cod_muni_pjp_17 <- cod_muni_pjp_17 %>% mutate(INENumCCAA = as.integer(INECodCCAA))
aa <- names_v_df_pjp(cod_INE_muni_pjp) #- ok, todo character y 3 integers
# use_data(cod_muni_pjp_17) #- lo guarde con esta linea que usa el pkg usethis el 2018-01-23





## Voy a fusionar cod_municipios_16 con cod_provincias
## Primero creo el codigo mas habitual en INE: INECodMuni
cod_municipios_16 <- cod_municipios_16 %>% mutate(INECodMuni = paste0(CPRO, CMUN)) #- Hay 8125 municipios.
cod_provincias <- cod_provincias %>% select(-CODAUTO) #- la quito xq sino se duplicaria
#- el fichero lo llamo cod_INE_muni_pjp
cod_muni_pjp_16 <-  left_join(cod_municipios_16, cod_provincias, by = "CPRO")
aa <- names_v_df_pjp(cod_INE_muni_pjp) #- ok, todo character
#- renombro las primeras columnas para hacerlas compatibles con "municipios_CNIG"
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% rename(NombreMuni = NOMBRE)
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% rename(NombreProv = PROVINCIA)
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% rename(NombreCCAA = CCAA)
#- cambio nombre de las series de cogigos, la de los municipios ya esta hecha (INECodMuni)
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% rename(INECodProv = CPRO)
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% rename(INECodCCAA = CODAUTO)
#- Creo version numerica de los codigos INE de CCAA, prov y municipios
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% mutate(INENumMuni = as.integer(INECodMuni))
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% mutate(INENumProv = as.integer(INECodProv))
cod_muni_pjp_16 <- cod_muni_pjp_16 %>% mutate(INENumCCAA = as.integer(INECodCCAA))
aa <- names_v_df_pjp(cod_muni_pjp_16) #- ok, todo character y 3 integers
# use_data(cod_muni_pjp_16) #- lo guarde con esta linea que usa el pkg usethis el 2018-01-23



