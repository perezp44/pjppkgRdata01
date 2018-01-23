#' This file documents datasets
#'
#' cod_provincias.rda
#'
#' Codigos del INE para provincias y CCAA españolas
#'
#' @format A data frame with 52 rows and 4 variables:
#' \itemize{
#'   \item CODAUTO: Código de CCAA
#'   \item CCAA: Nombre de la CCAA
#'   \item CPRO: Código de la provincia
#'   \item PROVINCIA: Nombre de la provincia
#' }
#'
#'
#' @source \url{http://www.ine.es}
"cod_provincias"



#' cod_municipios_17.rda
#'
#' Codigos del INE para municipios españoles a 1 enero 2017
#'
#' @format A data frame with 8124 rows and 4 variables: Cerdedo-Cotobade se unieron en 2016
#' \itemize{
#'   \item CODAUTO: Código de CCAA
#'   \item CPRO: Código de la provincia
#'   \item CMUN: Código del municipio
#'   \item DC: Código de control
#'   \item NOMBRE: Nombre del municipio
#' }
#'
#'
#' @source \url{http://www.ine.es}
"cod_municipios_17"



#' cod_municipios_16.rda
#'
#' Codigos del INE para municipios españoles a 1 enero 2016
#'
#' @format A data frame with 8125 rows and 4 variables:
#' \itemize{
#'   \item CODAUTO: Código de CCAA
#'   \item CPRO: Código de la provincia
#'   \item CMUN: Código del municipio
#'   \item DC: Código de control
#'   \item NOMBRE: Nombre del municipio
#' }
#'
#'
#' @source \url{http://www.ine.es}
"cod_municipios_16"




#' cod_muni_pjp_17.rda
#'
#' Codigos del INE para municipios españoles a 1 enero 2017
#' tb tiene los codigos de provincia y CCAA
#' los he unido yo asi:
#'
#' cod_municipios_17 <- cod_municipios_17 %>% mutate(INECodMuni = paste0(CPRO, CMUN)) #- Hay 8124 municipios.
#' cod_provincias <- cod_provincias %>% select(-CODAUTO) #- la quito xq sino se duplicaria
#' cod_muni_pjp_17 <-  left_join(cod_municipios_17, cod_provincias, by = "CPRO")
#' Mas detalles en /data-raw/make-datasets.R
#'
#'
#' @format A data frame with 8124 rows and 11 variables:
#' \itemize{
#'   \item INECodCCAA: Código de CCAA
#'   \item INECodProv: Código de la provincia
#'   \item CMUN: Código del municipio (es del INE, pero sin el codigo de la Provincia no es útil)
#'   \item DC: Código de control
#'   \item NombreMuni: Nombre del municipio
#'   \item INECodMuni: Código de provincia + Código municipio. Es el que usa el INE muchas veces (5 digitos)
#'   \item NombreCCAA: Nombre de la CCAA
#'   \item NombreProv: Nombre de la provincia
#'   \item INENumMuni: número del municipio (as.integer(INECodMuni))
#'   \item INENumProv: número de la provincia (as.integer(INECodProv))
#'   \item INENumCCAA: número de la CCAA (as.integer(INECodCCAA))
#' }
#'
#'
#' @source \url{http://www.ine.es}
"cod_muni_pjp_17"






#' cod_muni_pjp_16.rda
#'
#' Codigos del INE para municipios españoles a 1 enero 2016
#' tb tiene los codigos de provincia y CCAA
#' los he unido yo asi:
#'
#' cod_municipios_16 <- cod_municipios_16 %>% mutate(INECodMuni = paste0(CPRO, CMUN)) #- Hay 8125 municipios.
#' cod_provincias <- cod_provincias %>% select(-CODAUTO) #- la quito xq sino se duplicaria
#' cod_muni_pjp_16 <-  left_join(cod_municipios_16, cod_provincias, by = "CPRO")
#' Mas detalles en /data-raw/make-datasets.R
#'
#'
#' @format A data frame with 8125 rows and 11 variables:
#' \itemize{
#'   \item INECodCCAA: Código de CCAA
#'   \item INECodProv: Código de la provincia
#'   \item CMUN: Código del municipio (es del INE, pero sin el codigo de la Provincia no es útil)
#'   \item DC: Código de control
#'   \item NombreMuni: Nombre del municipio
#'   \item INECodMuni: Código de provincia + Código municipio. Es el que usa el INE muchas veces (5 digitos)
#'   \item NombreCCAA: Nombre de la CCAA
#'   \item NombreProv: Nombre de la provincia
#'   \item INENumMuni: número del municipio (as.integer(INECodMuni))
#'   \item INENumProv: número de la provincia (as.integer(INECodProv))
#'   \item INENumCCAA: número de la CCAA (as.integer(INECodCCAA))
#' }
#'
#'
#' @source \url{http://www.ine.es}
"cod_muni_pjp_16"


