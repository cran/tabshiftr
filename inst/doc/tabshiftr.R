## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    header = list(row = 1),
#    variables =
#      list(territories =
#             list(type = "id", col = 1),
#           year =
#             list(type = "id", col = 2),
#           commodities =
#             list(type = "id", col = 3),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1, col = 4),
#           production =
#             list(type = "measured", unit = "t", factor = 1, col = 5))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    header = list(row = c(1, 2)),
#    variables =
#      list(territories =
#             list(type = "id", col = 1),
#           year =
#             list(type = "id", col = 2),
#           commodities =
#             list(type = "id", row = 1, col = c(3, 5)),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1,
#                  row = 2, col = c(3, 5)),
#           production =
#             list(type = "measured", unit = "t", factor = 1,
#                  row = 2, col = c(4, 6)))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    header = list(row = c(1:3)),
#    variables =
#      list(territories =
#             list(type = "id", col = 1),
#           year =
#             list(type = "id", row = 1, col = c(2, 6)),
#           commodities =
#             list(type = "id", row = 2, col = c(2, 4, 6, 8)),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1,
#                  row = 3, col = c(2, 4, 6, 8)),
#           production =
#             list(type = "measured", unit = "t", factor = 1,
#                  row = 3, col = c(3, 5, 7, 9)))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    header = list(row = 1),
#    variables =
#      list(territories =
#             list(type = "id", col = 1),
#           year =
#             list(type = "id", split = ".+?(?=_)", col = 2),
#           commodities =
#             list(type = "id", split = "(?<=\\_).*", col = 2),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1, col = 3),
#           production =
#             list(type = "measured", unit = "t", factor = 1, col = 4))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    clusters =
#      list(row = 2, col = 1, id = "territories"),
#    header = list(row = 1, rel = TRUE),
#    variables =
#      list(territories =
#             list(type = "id", value = "unit 1"),
#           year =
#             list(type = "id", col = 4, rel = TRUE),
#           commodities =
#             list(type = "id", col = 1, rel = TRUE),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1,
#                  col = 2, rel = TRUE),
#           production =
#             list(type = "measured", unit = "t", factor = 1,
#                  col = 3, rel = TRUE))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    header = list(row = 1),
#    variables =
#      list(territories =
#             list(type = "id", col = 1),
#           year =
#             list(type = "id", col = 2),
#           commodities =
#             list(type = "id", col = 3),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1,
#                  col = 5, key = "dimension", value = "harvested"),
#           production =
#             list(type = "measured", unit = "t", factor = 1,
#                  col = 5, key = "dimension", value = "production"))))

## ---- eval=FALSE--------------------------------------------------------------
#   makeSchema(list(
#     header = list(row = 1),
#     variables =
#       list(territories =
#              list(type = "id", col = 1),
#            year =
#              list(type = "id", row = NULL, col = 2),
#            commodities =
#              list(type = "id", row = 1, col = c(4, 5)),
#            harvested =
#              list(type = "measured", unit = "ha", factor = 1,
#                   col = c(4, 5), key = "dimension", value = "harvested"),
#            production =
#              list(type = "measured", unit = "t", factor = 1,
#                   col = c(4, 5), key = "dimension", value = "production"))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    clusters =
#      list(row = 2, col = c(2, 5), id = "territories"),
#    header = list(row = 1),
#    variables =
#      list(territories =
#             list(type = "id", row = 2, col = c(2, 5)),
#           year =
#             list(type = "id", col = 1),
#           commodities =
#             list(type = "id", col = c(2, 5)),
#           harvested =
#             list(type = "measured", col = c(3, 6), unit = "ha", factor = 1),
#           production =
#             list(type = "measured", col = c(4, 7), unit = "t", factor = 1))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    clusters =
#      list(row = c(2, 7), col = 2, height = 4, id = "territories"),
#    header = list(row = 1),
#    variables =
#      list(territories =
#             list(type = "id", row = c(2, 9), col = 1),
#           year =
#             list(type = "id", col = 1, rel = TRUE),
#           commodities =
#             list(type = "id", col = 2, rel = TRUE),
#           harvested =
#             list(type = "measured", col = 3, unit = "ha", factor = 1, rel = TRUE),
#           production =
#             list(type = "measured", col = 4, unit = "t", factor = 1, rel = TRUE))))

## ---- eval=FALSE--------------------------------------------------------------
#  list(clusters =
#         list(top = c(1, 5, 1), left = c(1, 2, 5),
#              width = c(3, 5, 2), height = c(4, 5, 3), id = ...),
#       header = list(row = 1),
#       variables =
#         list(territories =
#                list(type = "id", col = 2, rel = TRUE),
#              period =
#                list(type = "id", col = 1, rel = TRUE),
#              ...))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    clusters =
#      list(row = c(3, 12), col = 2, height = 8, id = "measured"),
#    header = list(row = 1),
#    variables =
#      list(territories =
#             list(type = "id", col = 2),
#           year =
#             list(type = "id", col = 3),
#           commodities =
#             list(type = "id", col = 4),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1, col = 5,
#                  key = "cluster", value = 1),
#           production =
#             list(type = "measured", unit = "t", factor = 1, col = 5,
#                  key = "cluster", value = 2))))

## ---- eval=FALSE--------------------------------------------------------------
#  makeSchema(list(
#    clusters =
#      list(row = c(1, 8, 8), col = c(1, 1, 4), width = 3, height = 6,
#           id = "territories"),
#    meta = list(del = NULL, dec = NULL, na = NULL, types = NULL),
#    header = list(row = 1, rel = TRUE),
#    variables =
#      list(territories =
#             list(type = "id", row = 1, col = 1, rel = TRUE),
#           year =
#             list(type = "id", row = c(3:6), col = 4, dist = TRUE),
#           commodities =
#             list(type = "id", col = 1, rel = TRUE),
#           harvested =
#             list(type = "measured", unit = "ha", factor = 1,
#                  col = 2, rel = TRUE),
#           production =
#             list(type = "measured", unit = "t", factor = 1,
#                  col = 3, rel = TRUE))))

