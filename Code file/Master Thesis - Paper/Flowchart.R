detail_process1 <- boxGrob(glue("Dataset for model training"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process2 <- boxGrob(glue("Data cleaning"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process5 <- boxGrob(glue("Train K-nearest neighbor model",
                                "10-Fold CV",
                                .sep = "\n"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process6 <- boxGrob(glue("Train Support Vector Machine model",
                                "10-Fold CV",
                                .sep = "\n"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process7 <- boxGrob(glue("Train Random Forest model",
                                "10-Fold CV",
                                .sep = "\n"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process8 <- boxGrob(glue("Train XGboost model",
                                "10-Fold CV",
                                .sep = "\n"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process9 <- boxGrob(glue("Evaluate model performance"),
                           txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process10 <- boxGrob(glue("Evaluate model performance"),
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process11 <- boxGrob(glue("Evaluate model performance"),
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process12 <- boxGrob(glue("Evaluate model performance"),
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process4a <- boxGrob(glue("Data pre-processing:",
                                 "Center and scale data",
                                 "Oversampling",
                                 .sep = "\n"),
                            width = detail_process5$vp$width,
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process4b <- boxGrob(glue("Data pre-processing:",
                                 "Center and scale data",
                                 "Oversampling",
                                 .sep = "\n"),
                            width = detail_process12$vp$width,
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process4c <- boxGrob(glue("No pre-processing"),
                            height = detail_process4a$vp$height,
                            width = detail_process12$vp$width,
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))
detail_process4d <- boxGrob(glue("No pre-processing"), 
                            height = detail_process4a$vp$height,
                            width = detail_process12$vp$width,
                            txt_gp=grid::gpar(fontfamily="Times", fontsize=13))

grid.newpage()
vert <- spreadVertical(detail_process1 = detail_process1,
                       detail_process2 = detail_process2,
                       detail_process4a = detail_process4a,
                       detail_process5 = detail_process5,
                       detail_process9 = detail_process9)
grps0 <- alignVertical(reference = vert$detail_process4a,
                       detail_process4a = detail_process4a,
                       detail_process4b = detail_process4b,
                       detail_process4c = detail_process4c,
                       detail_process4d = detail_process4d) %>%
  spreadHorizontal()
grps1 <- alignHorizontal(reference = grps0$detail_process4a,
                         detail_process5 = detail_process5,
                         detail_process9 = detail_process9) %>%
  spreadVertical(.from = grps0$detail_process4a, .to = 0)
grps2 <- alignHorizontal(reference = grps0$detail_process4b,
                         detail_process6 = detail_process6,
                         detail_process10 = detail_process10) %>%
  spreadVertical(.from = grps0$detail_process4b, .to = 0)
grps3 <- alignHorizontal(reference = grps0$detail_process4c,
                         detail_process7 = detail_process7,
                         detail_process11 = detail_process11) %>%
  spreadVertical(.from = grps0$detail_process4c, .to = 0)
grps4 <- alignHorizontal(reference = grps0$detail_process4d,
                         detail_process8 = detail_process8,
                         detail_process12 = detail_process12) %>%
  spreadVertical(.from = grps0$detail_process4d, .to = 0)

vert$detail_process4a <- NULL
vert$detail_process5 <- NULL
vert$detail_process9 <- NULL

vert
grps0
grps1
grps2
grps3
grps4

connectGrob(vert$detail_process1, vert$detail_process2, type = "v")

connectGrob(vert$detail_process2, grps0$detail_process4a, type = "v")
connectGrob(vert$detail_process2, grps0$detail_process4b, type = "v")
connectGrob(vert$detail_process2, grps0$detail_process4c, type = "v")
connectGrob(vert$detail_process2, grps0$detail_process4d, type = "v")

connectGrob(grps0$detail_process4a, grps1$detail_process5, type = "v")
connectGrob(grps0$detail_process4b, grps2$detail_process6, type = "v")
connectGrob(grps0$detail_process4c, grps3$detail_process7, type = "v")
connectGrob(grps0$detail_process4d, grps4$detail_process8, type = "v")

connectGrob(grps1$detail_process5, grps1$detail_process9, type = "v")
connectGrob(grps2$detail_process6, grps2$detail_process10, type = "v")
connectGrob(grps3$detail_process7, grps3$detail_process11, type = "v")
connectGrob(grps4$detail_process8, grps4$detail_process12, type = "v")