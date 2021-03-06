% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{cod_muni_pjp_16}
\alias{cod_muni_pjp_16}
\title{cod_muni_pjp_16.rda}
\format{A data frame with 8125 rows and 11 variables:
\itemize{
\item INECodCCAA: Código de CCAA
\item INECodProv: Código de la provincia
\item CMUN: Código del municipio (es del INE, pero sin el codigo de la Provincia no es útil)
\item DC: Código de control
\item NombreMuni: Nombre del municipio
\item INECodMuni: Código de provincia + Código municipio. Es el que usa el INE muchas veces (5 digitos)
\item NombreCCAA: Nombre de la CCAA
\item NombreProv: Nombre de la provincia
\item INENumMuni: número del municipio (as.integer(INECodMuni))
\item INENumProv: número de la provincia (as.integer(INECodProv))
\item INENumCCAA: número de la CCAA (as.integer(INECodCCAA))
}}
\source{
\url{http://www.ine.es}
}
\usage{
cod_muni_pjp_16
}
\description{
Codigos del INE para municipios españoles a 1 enero 2016
tb tiene los codigos de provincia y CCAA
los he unido yo asi:
}
\details{
cod_municipios_16 <- cod_municipios_16 %>% mutate(INECodMuni = paste0(CPRO, CMUN)) #- Hay 8125 municipios.
cod_provincias <- cod_provincias %>% select(-CODAUTO) #- la quito xq sino se duplicaria
cod_muni_pjp_16 <-  left_join(cod_municipios_16, cod_provincias, by = "CPRO")
Mas detalles en /data-raw/make-datasets.R
}
\keyword{datasets}
