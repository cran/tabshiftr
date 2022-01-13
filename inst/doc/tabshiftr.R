## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
options(knitr.kable.NA = '.')
library(tabshiftr)
library(knitr)

## ---- eval=F------------------------------------------------------------------
#  input <- read_csv(file = ...,
#                    col_names = FALSE,
#                    col_types = cols(.default = "c"))

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$listed_column_wide)

## -----------------------------------------------------------------------------
schema <- setIDVar(name = "territories", columns = 1)

## -----------------------------------------------------------------------------
validateSchema(schema = schema, input = input) %>% 
  getIDVars(input = input)

## -----------------------------------------------------------------------------
schema <- schema %>% 
  setIDVar(name = "year", columns = 2) %>%
  setIDVar(name = "commodities", columns = c(6, 7), rows = 1)

## -----------------------------------------------------------------------------
validateSchema(schema = schema, input = input) %>% 
  getIDVars(input = input)

## -----------------------------------------------------------------------------
schema <- schema %>% 
  setObsVar(name = "harvested", columns = c(6, 7), key = 4, value = "harvested") %>%
  setObsVar(name = "production", columns = c(6, 7), key = 4, value = "production")

## -----------------------------------------------------------------------------
validateSchema(schema = schema, input = input) %>% 
  getObsVars(input = input)

## -----------------------------------------------------------------------------
schema # has a pretty print function

reorganise(input = input, schema = schema)

## -----------------------------------------------------------------------------
kable(tabs2shift$tidy)

## -----------------------------------------------------------------------------
schema <-
  setIDVar(name = "territories", columns = 1) %>%
  setIDVar(name = "year", columns = 2) %>%
  setIDVar(name = "commodities", columns = 3) %>%
  setObsVar(name = "harvested", columns = 5) %>%
  setObsVar(name = "production", columns = 6, factor = 0.1)

reorganise(input = tabs2shift$tidy, schema = schema)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$split_column)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = c(2, 4), merge = " ") %>%
#    setIDVar(name = "commodities", columns = 5) %>%
#    setObsVar(name = "harvested", columns = 6) %>%
#    setObsVar(name = "production", columns = 7)

## -----------------------------------------------------------------------------
kable(tabs2shift$merged_column)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = 2, split = ".+?(?=_)") %>%
#    setIDVar(name = "commodities", columns = 2, split = "(?<=\\_).*") %>%
#    setObsVar(name = "harvested", columns = 4) %>%
#    setObsVar(name = "production", columns = 5)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$implicit_variable)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = "territories",
#                       left = 1, top = 4) %>%
#    setIDVar(name = "territories", value = "unit 1") %>%
#    setIDVar(name = "year", columns = 4) %>%
#    setIDVar(name = "commodities", columns = 1) %>%
#    setObsVar(name = "harvested", columns = 2) %>%
#    setObsVar(name = "production", columns = 3)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$one_wide_id)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = 3) %>%
#    setIDVar(name = "commodities", columns = c(4, 6), rows = 1) %>%
#    setObsVar(name = "harvested", columns = c(4, 6), top = 2) %>%
#    setObsVar(name = "production", columns = c(5, 7), top = 2)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$wide_obs)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = 2) %>%
#    setIDVar(name = "commodities", columns = c(3:6), rows = 2) %>%
#    setObsVar(name = "harvested", columns = c(3, 4)) %>%
#    setObsVar(name = "production", columns = c(5, 6))

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$two_wide_id)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = c(2, 6), rows = 1) %>%
#    setIDVar(name = "commodities", columns = c(2, 4, 6, 8), rows = 2) %>%
#    setObsVar(name = "harvested", columns = c(2, 4, 6, 8), top = 3) %>%
#    setObsVar(name = "production", columns = c(3, 5, 7, 9), top = 3)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$listed_column)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = 2) %>%
#    setIDVar(name = "commodities", columns = 3) %>%
#    setObsVar(name = "harvested", columns = 7, key = 6, value = "harvested") %>%
#    setObsVar(name = "production", columns = 7, key = 6, value = "production")

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$listed_column_wide)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <-
#    setIDVar(name = "territories", columns = 1) %>%
#    setIDVar(name = "year", columns = 2) %>%
#    setIDVar(name = "commodities", columns = c(6, 7), rows = 1) %>%
#    setObsVar(name = "harvested", columns = c(6, 7), key = 4, value = "harvested") %>%
#    setObsVar(name = "production", columns = c(6, 7), key = 4, value = "production")

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$clusters_horizontal)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = "territories",
#                       left = c(1, 6), top = 2) %>%
#    setIDVar(name = "territories", columns = c(1, 6), rows = 2) %>%
#    setIDVar(name = "year", columns = c(2, 7)) %>%
#    setIDVar(name = "commodities", columns = c(1, 6)) %>%
#    setObsVar(name = "harvested", columns = c(3, 8)) %>%
#    setObsVar(name = "production", columns = c(4, 9))

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$clusters_vertical)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = "territories",
#                       left = 1, top = c(3, 9)) %>%
#    setIDVar(name = "territories", columns = 1, rows = c(3, 9)) %>%
#    setIDVar(name = "year", columns = 2) %>%
#    setIDVar(name = "commodities", columns = 5) %>%
#    setObsVar(name = "harvested", columns = 6) %>%
#    setObsVar(name = "production", columns = 7)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$clusters_observed)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = "observed",
#                       left = 1, top = c(2, 12)) %>%
#    setIDVar(name = "territories", columns = 2) %>%
#    setIDVar(name = "year", columns = 3) %>%
#    setIDVar(name = "commodities", columns = 5) %>%
#    setObsVar(name = "harvested", columns = 7, key = "cluster", value = 1) %>%
#    setObsVar(name = "production", columns = 7, key = "cluster", value = 2)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$clusters_nested)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = "sublevel",
#                       group = "territories", member = c(1, 1, 2),
#                       left = 1, top = c(3, 8, 15)) %>%
#    setIDVar(name = "territories", columns = 1, rows = c(2, 14)) %>%
#    setIDVar(name = "sublevel", columns = 1, rows = c(3, 8, 15)) %>%
#    setIDVar(name = "year", columns = 7) %>%
#    setIDVar(name = "commodities", columns = 2) %>%
#    setObsVar(name = "harvested", columns = 5) %>%
#    setObsVar(name = "production", columns = 6)

## -----------------------------------------------------------------------------
kable(input <- tabs2shift$clusters_messy)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = "territories",
#                       left = c(1, 1, 4), top = c(1, 8, 8)) %>%
#    setIDVar(name = "territories", columns = c(1, 1, 4), rows = c(2, 9, 9)) %>%
#    setIDVar(name = "year", columns = 4, rows = c(3:6), distinct = TRUE) %>%
#    setIDVar(name = "commodities", columns = c(1, 1, 4)) %>%
#    setObsVar(name = "harvested", columns = c(2, 2, 5)) %>%
#    setObsVar(name = "production", columns = c(3, 3, 6))
#  
#  schema_alt <- setCluster(id = "territories",
#                           left = c(1, 1, 4), top = c(1, 8, 8)) %>%
#    setIDVar(name = "territories", columns = 1, rows = 2, relative = TRUE) %>%
#    setIDVar(name = "year", columns = 4, rows = c(3:6), distinct = TRUE) %>%
#    setIDVar(name = "commodities", columns = 1, relative = TRUE) %>%
#    setObsVar(name = "harvested", columns = 2, relative = TRUE) %>%
#    setObsVar(name = "production", columns = 3, relative = TRUE)

## ---- eval=FALSE--------------------------------------------------------------
#  schema <- setCluster(id = ...,
#                       left = c(1, 2, 5), top = c(1, 5, 1),
#                       width = c(3, 5, 2), height = c(4, 5, 3),
#                       ...) %>%
#    setIDVar(name = "territories", columns = 1, relative = TRUE) %>%
#    ...

