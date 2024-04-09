library(shiny)
library(shinyjs)
library(shiny.i18n)
library(shinythemes)
library(shinyWidgets)

# Initialize Translator

i18n <- Translator$new(translation_json_path = "translate.json")

i18n$set_translation_language("en")

# Define UI
ui <- fluidPage(
  shinyjs::useShinyjs(),  # Enable shinyjs
  
  # setBackgroundColor(
  #   color = c("#F7FBFF", "#2171B5"),
  #   gradient = "linear",
  #   direction = "bottom"
  # ),
  
  # Change theme
  theme = shinytheme("darkly"),
  
  # Use i18n in UI
  usei18n(i18n),
  selectInput(
    inputId = "selected_language",
    label = i18n$t("Change language (Thay đổi ngôn ngữ)"),
    choices = setNames(
      i18n$get_languages(),
      c("English", "Vietnamese") # Set labels for the languages
    ),
    selected = i18n$get_key_translation()
  ),
  
  titlePanel(h1(i18n$t("Apply AI in screening for Down Syndrome"), align = "center")),
  
  # Define tabs
  tabsetPanel(
    
    # User guide
    tabPanel(i18n$t("User guide"),
             p(i18n$t("ALL THE RESULT SHOULD BE CONSIDERED AS A REFERENCE ONLY. PLEASE CONSULT YOUR DOCTOR FOR MORE INFORMATION.")),
             p(i18n$t("This Shiny Web App uses machine learning models to predict the risk of having fetus with Down Syndrome in pregnant women.")),
             p(i18n$t("All models were built using data from Vietnamese women.")),
             p(i18n$t("There are 6 tabs, each tab is developed using tests that pregnant women have done at a medical facility.")),
             p(i18n$t("Users fill in values with appropriate units according to the tests performed.")),
             p(i18n$t("e.g. A pregnant woman who had an ultrasound test result in her first trimester would fill in the 'Trimester 1 ultrasound' tab.")),
             p(i18n$t("THE TAB COMBINING BOTH ULTRASOUND AND BIOCHEMISTRY WILL GIVE THE MOST ACCURATE RESULTS COMPARED TO THE OTHER 2 PARTS OF EACH TRIMESTER.")),
    ),
    
    # Tab 1
    tabPanel(i18n$t("Trimester 1 ultrasound"),
             # Input
             column(8, align="center", offset = 2,
             numericInput("tuoime_tab1", i18n$t("Mother's age"), value = 0, step = 0.1),
             numericInput("tuoithai_tab1", i18n$t("Fetus's age"), value = 0, step = 0.1),
             selectInput("tiensusinhconhoichungdown_tab1", i18n$t("History of having children with Down Syndrome"), choices = c("no" = "0", "yes" = "1")),
             numericInput("chieudaidaumong_tab1", i18n$t("Fetal crown-rump length"), value = 0, step = 0.1),
             numericInput("dau_duongkinhluongdinh_tab1", i18n$t("Biparietal diameter"), value = 0, step = 0.1),
             numericInput("dau_chuvidau_tab1", i18n$t("Head circumference"), value = 0, step = 0.1),
             selectInput("mat_moimui_tab1", i18n$t("Abnormal fetal nose"), choices = c("no" = "0", "yes" = "1")),
             numericInput("nguc_nhiptimthai_tab1", i18n$t("Fetal heart rate"), value = 0, step = 0.1),
             numericInput("d_khoangsangsaugay_tab1", i18n$t("Nuchal translucency"), value = 0, step = 0.1),
             
             # Confirmation button
             actionButton("confirm_tab1", i18n$t("Confirm")),
             
             # Output
             textOutput("output_text_tab1")),
    ),
    
    # Tab 2
    tabPanel(i18n$t("Trimester 1 biochemical"),
             # Input
             column(8, align="center", offset = 2,
             numericInput("d_mom_pappa_tab2", i18n$t("MoM PAPP-A"), value = 0, step = 0.1),
             numericInput("d_mom_hcgb_tab2", i18n$t("MoM β-hCG"), value = 0, step = 0.1),
             
             # Confirmation
             actionButton("confirm_tab2", i18n$t("Confirm")),
             
             # Output
             textOutput("output_text_tab2")),
    ),
    
    # Tab 3
    tabPanel(i18n$t("Trimester 1 ultrasound and biochemical"),
             # Input
             column(8, align="center", offset = 2,
             numericInput("tuoime_tab3", i18n$t("Mother's age"), value = 0, step = 0.1),
             numericInput("tuoithai_tab3", i18n$t("Fetus's age"), value = 0, step = 0.1),
             selectInput("tiensusinhconhoichungdown_tab3", i18n$t("History of having children with Down Syndrome"), choices = c("no" = "0", "yes" = "1")),
             numericInput("chieudaidaumong_tab3", i18n$t("Fetal crown-rump length"), value = 0, step = 0.1),
             numericInput("dau_duongkinhluongdinh_tab3", i18n$t("Biparietal diameter"), value = 0, step = 0.1),
             numericInput("dau_chuvidau_tab3", i18n$t("Head circumference"), value = 0, step = 0.1),
             selectInput("mat_moimui_tab3", i18n$t("Abnormal fetal nose"), choices = c("no" = "0", "yes" = "1")),
             numericInput("nguc_nhiptimthai_tab3", i18n$t("Fetal heart rate"), value = 0, step = 0.1),
             numericInput("d_khoangsangsaugay_tab3", i18n$t("Nuchal translucency"), value = 0, step = 0.1),
             numericInput("d_mom_pappa_tab3", i18n$t("MoM PAPP-A"), value = 0, step = 0.1),
             numericInput("d_mom_hcgb_tab3", i18n$t("MoM β-hCG"), value = 0, step = 0.1),
             
             # Confirmation button
             actionButton("confirm_tab3", i18n$t("Confirm")),
             
             # Output
             textOutput("output_text_tab3")),
    ),
    
    # Tab 4
    tabPanel(i18n$t("Trimester 2 ultrasound"),
             # Input
             column(8, align="center", offset = 2,
             numericInput("tuoime_tab4", i18n$t("Mother's age"), value = 0, step = 0.1),
             numericInput("tuoithai_tab4", i18n$t("Fetus's age"), value = 0, step = 0.1),
             selectInput("tiensusinhconhoichungdown_tab4", i18n$t("History of having children with Down Syndrome"), choices = c("no" = "0", "yes" = "1")),
             numericInput("dau_duongkinhluongdinh_tab4", i18n$t("Biparietal diameter"), value = 0, step = 0.1),
             numericInput("dau_chuvidau_tab4", i18n$t("Head circumference"), value = 0, step = 0.1),
             selectInput("mat_moimui_tab4", i18n$t("Abnormal fetal nose"), choices = c("no" = "0", "yes" = "1")),
             numericInput("nguc_nhiptimthai_tab4", i18n$t("Fetal heart rate"), value = 0, step = 0.1),
             selectInput("nguc_ditattim_tab4", i18n$t("Abnormal fetal heart"), choices = c("no" = "0", "yes" = "1")),
             numericInput("chi_chieudaixuongdui_tab4", i18n$t("Fetal femur length"), value = 0, step = 0.1),
             
             # Confirmation button
             actionButton("confirm_tab4", i18n$t("Confirm")),
             
             # Output
             textOutput("output_text_tab4")),
    ),
    
    # Tab 5
    tabPanel(i18n$t("Trimester 2 biochemical"),
             # Input
             column(8, align="center", offset = 2,
             numericInput("t_mom_afp_tab5", i18n$t("MoM AFP"), value = 0, step = 0.1),
             numericInput("t_mom_hcg_tab5", i18n$t("MoM hCG"), value = 0, step = 0.1),
             numericInput("t_mom_ue3_tab5", i18n$t("MoM uE3"), value = 0, step = 0.1),
             
             # Confirmation button
             actionButton("confirm_tab5", i18n$t("Confirm")),
             
             # Output
             textOutput("output_text_tab5")),
    ),
    
    # Tab 6
    tabPanel(i18n$t("Trimester 2 ultrasound and biochemical"),
             # Input
             column(8, align="center", offset = 2,
             numericInput("tuoime_tab6", i18n$t("Mother's age"), value = 0, step = 0.1),
             numericInput("tuoithai_tab6", i18n$t("Fetus's age"), value = 0, step = 0.1),
             selectInput("tiensusinhconhoichungdown_tab6", i18n$t("History of having children with Down Syndrome"), choices = c("no" = "0", "yes" = "1")),
             numericInput("dau_duongkinhluongdinh_tab6", i18n$t("Biparietal diameter"), value = 0, step = 0.1),
             numericInput("dau_chuvidau_tab6", i18n$t("Head circumference"), value = 0, step = 0.1),
             selectInput("mat_moimui_tab6", i18n$t("Abnormal fetal nose"), choices = c("no" = "0", "yes" = "1")),
             numericInput("nguc_nhiptimthai_tab6", i18n$t("Fetal heart rate"), value = 0, step = 0.1),
             selectInput("nguc_ditattim_tab6", i18n$t("Abnormal fetal heart"), choices = c("no" = "0", "yes" = "1")),
             numericInput("chi_chieudaixuongdui_tab6", i18n$t("Fetal femur length"), value = 0, step = 0.1),
             numericInput("t_mom_afp_tab6", i18n$t("MoM AFP"), value = 0, step = 0.1),
             numericInput("t_mom_hcg_tab6", i18n$t("MoM hCG"), value = 0, step = 0.1),
             numericInput("t_mom_ue3_tab6", i18n$t("MoM uE3"), value = 0, step = 0.1),
             
             # Confirmation button
             actionButton("confirm_tab6", i18n$t("Confirm")),
             
             # Output
             textOutput("output_text_tab6")),
    ),
    
    # About
    tabPanel(i18n$t("About"),
             p(i18n$t("This Shiny Web App was developed using the result of my Master Thesis titled 'Apply Machine Learning In Prenatal Screening For Down Syndrom At Hanoi Medical University Hospital'.")),
             p(i18n$t("All data used for this Shiny App belonged to a national study named 'Research to build an artificial intelligence system to support prenatal screening for some common abnormalities in Vietnam' funded under the KC 4.0 program of the Vietnam Ministry of Science and Technology.")),
             p(i18n$t("This App is developed for non-profit purposes.")),
             p(i18n$t("All the right is belong to the Vietnamese Government.")),
             p(i18n$t("My name is Huy Duc Do.")),
             p(i18n$t("I'm currently working as a data manager at the Center For Training And Research On Substance Abuse and HIV/AIDS - Hanoi Medical University.")),
             p(i18n$t("Please feel free to contact me if you have any questions or suggestions")),
             p(i18n$t("Email: huydd1905@gmail.com")),
             p(i18n$t("Tel: (+84)376190596")),
             p(i18n$t("Thank you!!!")),
    )
  )
)
server <- function(input, output, session) {
  
  # Tab 1
  reactive_tab1 <- eventReactive(input$confirm_tab1, {
    
    # Create data frame using user input
    data_tab1 <- data.frame(
      tuoime = input$tuoime_tab1,
      tuoithai = input$tuoithai_tab1,
      tiensusinhconhoichungdown = input$tiensusinhconhoichungdown_tab1,
      chieudaidaumong = input$chieudaidaumong_tab1,
      dau_duongkinhluongdinh = input$dau_duongkinhluongdinh_tab1,
      dau_chuvidau = input$dau_chuvidau_tab1,
      mat_moimui = input$mat_moimui_tab1,
      nguc_nhiptimthai = input$nguc_nhiptimthai_tab1,
      d_khoangsangsaugay = input$d_khoangsangsaugay_tab1
    )
    
    prepro_sa_tk1 <- preProcess(train_sa_tk1, method = c("center", "scale"))
    prepro_data_tab1 <- predict(prepro_sa_tk1, data_tab1)
    
    # Run all 4 models through newly created data frame
    knn_tab1 <- predict(knn_sa_tk1, newdata = prepro_data_tab1, type = "prob")
    svm_tab1 <- predict(svm_sa_tk1, newdata = prepro_data_tab1, type = "prob")
    rf_tab1 <- predict(rf_sa_tk1, newdata = data_tab1, type = "prob")
    xgb_tab1 <- predict(xgb_sa_tk1, newdata = data_tab1, type = "prob")
    
    # Create new variables to determine the risk of having Down Syndrome with each model by compare the result to threshold
    data_tab1$knn_result <- ifelse(knn_tab1[,1] < coords_knn_sa_tk1$threshold, 1, 0)
    data_tab1$svm_result <- ifelse(svm_tab1[,1] < coords_svm_sa_tk1$threshold, 1, 0)
    data_tab1$rf_result <- ifelse(rf_tab1[,1] < coords_rf_sa_tk1$threshold, 1, 0)
    data_tab1$xgb_result <- ifelse(xgb_tab1[,1] < coords_xgb_sa_tk1$threshold, 1, 0)
    
    if (data_tab1$knn_result + data_tab1$svm_result + data_tab1$rf_result + data_tab1$xgb_result == 2) {
      # Create new variables to weight each model based on training accuracy
      data_tab1$knn_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"]*data_tab1$knn_result
      data_tab1$svm_weight <- svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"]*data_tab1$svm_result
      data_tab1$rf_weight <- rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"]*data_tab1$rf_result
      data_tab1$xgb_weight <- xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]*data_tab1$xgb_result
      
      # Create a new variable to get the sum of all model training accuracy
      data_tab1$overall_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"] + svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"] + rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"] + xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]
      
      # Create a new variable to get the final decision if the total of weight is higher than half of sum of all training accuracy
      data_tab1$conclude <- ifelse((data_tab1$knn_weight + data_tab1$svm_weight + data_tab1$rf_weight + data_tab1$xgb_weight) / data_tab1$overall_weight > 0.5, 1, 0)
    } else if (data_tab1$knn_result + data_tab1$svm_result + data_tab1$rf_result + data_tab1$xgb_result > 2) {
      data_tab1$conclude <- 1
    } else {
      data_tab1$conclude <- 0
    }
    return(data_tab1$conclude)
  })
  
  # Tab 2
  reactive_tab2 <- eventReactive(input$confirm_tab2, {
    
    # Create data frame using user input
    data_tab2 <- data.frame(
      d_mom_pappa = input$d_mom_pappa_tab2,
      d_mom_hcgb = input$d_mom_hcgb_tab2
    )
    
    prepro_sh_tk1 <- preProcess(train_sh_tk1, method = c("center", "scale"))
    prepro_data_tab2 <- predict(prepro_sh_tk1, data_tab2)
    
    # Run all 4 models through newly created data frame
    knn_tab2 <- predict(knn_sh_tk1, newdata = prepro_data_tab2, type = "prob")
    svm_tab2 <- predict(svm_sh_tk1, newdata = prepro_data_tab2, type = "prob")
    rf_tab2 <- predict(rf_sh_tk1, newdata = data_tab2, type = "prob")
    xgb_tab2 <- predict(xgb_sh_tk1, newdata = data_tab2, type = "prob")
    
    # Create new variables to determine the risk of having Down Syndrome with each model by compare the result to threshold
    data_tab2$knn_result <- ifelse(knn_tab2[,1] < coords_knn_sh_tk1$threshold, 1, 0)
    data_tab2$svm_result <- ifelse(svm_tab2[,1] < coords_svm_sh_tk1$threshold, 1, 0)
    data_tab2$rf_result <- ifelse(rf_tab2[,1] < coords_rf_sh_tk1$threshold, 1, 0)
    data_tab2$xgb_result <- ifelse(xgb_tab2[,1] < coords_xgb_sh_tk1$threshold, 1, 0)
    
    if (data_tab2$knn_result + data_tab2$svm_result + data_tab2$rf_result + data_tab2$xgb_result == 2) {
      # Create new variables to weight each model based on training accuracy
      data_tab2$knn_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"]*data_tab2$knn_result
      data_tab2$svm_weight <- svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"]*data_tab2$svm_result
      data_tab2$rf_weight <- rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"]*data_tab2$rf_result
      data_tab2$xgb_weight <- xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]*data_tab2$xgb_result
      
      # Create a new variable to get the sum of all model training accuracy
      data_tab2$overall_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"] + svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"] + rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"] + xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]
      
      # Create a new variable to get the final decision if the total of weight is higher than half of sum of all training accuracy
      data_tab2$conclude <- ifelse((data_tab2$knn_weight + data_tab2$svm_weight + data_tab2$rf_weight + data_tab2$xgb_weight) / data_tab2$overall_weight > 0.5, 1, 0)
    } else if (data_tab2$knn_result + data_tab2$svm_result + data_tab2$rf_result + data_tab2$xgb_result > 2) {
      data_tab2$conclude <- 1
    } else {
      data_tab2$conclude <- 0
    }
    return(data_tab2$conclude)
  })

  # Tab 3
  reactive_tab3 <- eventReactive(input$confirm_tab3, {
    
    # Create data frame using user input
    data_tab3 <- data.frame(
      tuoime = input$tuoime_tab3,
      tuoithai = input$tuoithai_tab3,
      tiensusinhconhoichungdown = input$tiensusinhconhoichungdown_tab3,
      chieudaidaumong = input$chieudaidaumong_tab3,
      dau_duongkinhluongdinh = input$dau_duongkinhluongdinh_tab3,
      dau_chuvidau = input$dau_chuvidau_tab3,
      mat_moimui = input$mat_moimui_tab3,
      nguc_nhiptimthai = input$nguc_nhiptimthai_tab3,
      d_khoangsangsaugay = input$d_khoangsangsaugay_tab3,
      d_mom_pappa = input$d_mom_pappa_tab3,
      d_mom_hcgb = input$d_mom_hcgb_tab3
    )
    
    prepro_sash_tk1 <- preProcess(train_sash_tk1, method = c("center", "scale"))
    prepro_data_tab3 <- predict(prepro_sash_tk1, data_tab3)
    
    # Run all 4 models through newly created data frame
    knn_tab3 <- predict(knn_sash_tk1, newdata = prepro_data_tab3, type = "prob")
    svm_tab3 <- predict(svm_sash_tk1, newdata = prepro_data_tab3, type = "prob")
    rf_tab3 <- predict(rf_sash_tk1, newdata = data_tab3, type = "prob")
    xgb_tab3 <- predict(xgb_sash_tk1, newdata = data_tab3, type = "prob")
    
    # Create new variables to determine the risk of having Down Syndrome with each model by compare the result to threshold
    data_tab3$knn_result <- ifelse(knn_tab3[,1] < coords_knn_sash_tk1$threshold, 1, 0)
    data_tab3$svm_result <- ifelse(svm_tab3[,1] < coords_svm_sash_tk1$threshold, 1, 0)
    data_tab3$rf_result <- ifelse(rf_tab3[,1] < coords_rf_sash_tk1$threshold, 1, 0)
    data_tab3$xgb_result <- ifelse(xgb_tab3[,1] < coords_xgb_sash_tk1$threshold, 1, 0)
    
    if (data_tab3$knn_result + data_tab3$svm_result + data_tab3$rf_result + data_tab3$xgb_result == 2) {
      # Create new variables to weight each model based on training accuracy
      data_tab3$knn_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"]*data_tab3$knn_result
      data_tab3$svm_weight <- svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"]*data_tab3$svm_result
      data_tab3$rf_weight <- rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"]*data_tab3$rf_result
      data_tab3$xgb_weight <- xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]*data_tab3$xgb_result
      
      # Create a new variable to get the sum of all model training accuracy
      data_tab3$overall_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"] + svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"] + rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"] + xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]
      
      # Create a new variable to get the final decision if the total of weight is higher than half of sum of all training accuracy
      data_tab3$conclude <- ifelse((data_tab3$knn_weight + data_tab3$svm_weight + data_tab3$rf_weight + data_tab3$xgb_weight) / data_tab3$overall_weight > 0.5, 1, 0)
    } else if (data_tab3$knn_result + data_tab3$svm_result + data_tab3$rf_result + data_tab3$xgb_result > 2) {
      data_tab3$conclude <- 1
    } else {
      data_tab3$conclude <- 0
    }
    return(data_tab3$conclude)
  })
  
  # Tab 4
  reactive_tab4 <- eventReactive(input$confirm_tab4, {
        
    # Create data frame using user input
    data_tab4 <- data.frame(
      tuoime = input$tuoime_tab4,
      tuoithai = input$tuoithai_tab4,
      tiensusinhconhoichungdown = input$tiensusinhconhoichungdown_tab4,
      dau_duongkinhluongdinh = input$dau_duongkinhluongdinh_tab4,
      dau_chuvidau = input$dau_chuvidau_tab4,
      mat_moimui = input$mat_moimui_tab4,
      nguc_nhiptimthai = input$nguc_nhiptimthai_tab4,
      d_khoangsangsaugay = input$d_khoangsangsaugay_tab4,
      nguc_ditattim = input$nguc_ditattim_tab4,
      chi_chieudaixuongdui = input$chi_chieudaixuongdui_tab4
    )
    
    prepro_sa_tk2 <- preProcess(train_sa_tk2, method = c("center", "scale"))
    prepro_data_tab4 <- predict(prepro_sa_tk2, data_tab4)
    
    # Run all 4 models through newly created data frame
    knn_tab4 <- predict(knn_sa_tk2, newdata = prepro_data_tab4, type = "prob")
    svm_tab4 <- predict(svm_sa_tk2, newdata = prepro_data_tab4, type = "prob")
    rf_tab4 <- predict(rf_sa_tk2, newdata = data_tab4, type = "prob")
    xgb_tab4 <- predict(xgb_sa_tk2, newdata = data_tab4, type = "prob")
    
    # Create new variables to determine the risk of having Down Syndrome with each model by compare the result to threshold
    data_tab4$knn_result <- ifelse(knn_tab4[,1] < coords_knn_sa_tk2$threshold, 1, 0)
    data_tab4$svm_result <- ifelse(svm_tab4[,1] < coords_svm_sa_tk2$threshold, 1, 0)
    data_tab4$rf_result <- ifelse(rf_tab4[,1] < coords_rf_sa_tk2$threshold, 1, 0)
    data_tab4$xgb_result <- ifelse(xgb_tab4[,1] < coords_xgb_sa_tk2$threshold, 1, 0)
    
    if (data_tab4$knn_result + data_tab4$svm_result + data_tab4$rf_result + data_tab4$xgb_result == 2) {
      # Create new variables to weight each model based on training accuracy
      data_tab4$knn_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"]*data_tab4$knn_result
      data_tab4$svm_weight <- svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"]*data_tab4$svm_result
      data_tab4$rf_weight <- rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"]*data_tab4$rf_result
      data_tab4$xgb_weight <- xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]*data_tab4$xgb_result
      
      # Create a new variable to get the sum of all model training accuracy
      data_tab4$overall_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"] + svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"] + rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"] + xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]
      
      # Create a new variable to get the final decision if the total of weight is higher than half of sum of all training accuracy
      data_tab4$conclude <- ifelse((data_tab4$knn_weight + data_tab4$svm_weight + data_tab4$rf_weight + data_tab4$xgb_weight) / data_tab4$overall_weight > 0.5, 1, 0)
    } else if (data_tab4$knn_result + data_tab4$svm_result + data_tab4$rf_result + data_tab4$xgb_result > 2) {
      data_tab4$conclude <- 1
    } else {
      data_tab4$conclude <- 0
    }
    return(data_tab4$conclude)
  })

  # Tab 5
  reactive_tab5 <- eventReactive(input$confirm_tab5, {
    
    # Create data frame using user input
    data_tab5 <- data.frame(
      t_mom_afp = input$t_mom_afp_tab5,
      t_mom_hcg = input$t_mom_hcg_tab5,
      t_mom_ue3 = input$t_mom_ue3_tab5
    )
    
    prepro_sh_tk2 <- preProcess(train_sh_tk2, method = c("center", "scale"))
    prepro_data_tab5 <- predict(prepro_sh_tk2, data_tab5)
    
    # Run all 4 models through newly created data frame
    knn_tab5 <- predict(knn_sh_tk2, newdata = prepro_data_tab5, type = "prob")
    svm_tab5 <- predict(svm_sh_tk2, newdata = prepro_data_tab5, type = "prob")
    rf_tab5 <- predict(rf_sh_tk2, newdata = data_tab5, type = "prob")
    xgb_tab5 <- predict(xgb_sh_tk2, newdata = data_tab5, type = "prob")
    
    # Create new variables to determine the risk of having Down Syndrome with each model by compare the result to threshold
    data_tab5$knn_result <- ifelse(knn_tab5[,1] < coords_knn_sh_tk2$threshold, 1, 0)
    data_tab5$svm_result <- ifelse(svm_tab5[,1] < coords_svm_sh_tk2$threshold, 1, 0)
    data_tab5$rf_result <- ifelse(rf_tab5[,1] < coords_rf_sh_tk2$threshold, 1, 0)
    data_tab5$xgb_result <- ifelse(xgb_tab5[,1] < coords_xgb_sh_tk2$threshold, 1, 0)
    
    if (data_tab5$knn_result + data_tab5$svm_result + data_tab5$rf_result + data_tab5$xgb_result == 2) {
      # Create new variables to weight each model based on training accuracy
      data_tab5$knn_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"]*data_tab5$knn_result
      data_tab5$svm_weight <- svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"]*data_tab5$svm_result
      data_tab5$rf_weight <- rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"]*data_tab5$rf_result
      data_tab5$xgb_weight <- xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]*data_tab5$xgb_result
      
      # Create a new variable to get the sum of all model training accuracy
      data_tab5$overall_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"] + svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"] + rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"] + xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]
      
      # Create a new variable to get the final decision if the total of weight is higher than half of sum of all training accuracy
      data_tab5$conclude <- ifelse((data_tab5$knn_weight + data_tab5$svm_weight + data_tab5$rf_weight + data_tab5$xgb_weight) / data_tab5$overall_weight > 0.5, 1, 0)
    } else if (data_tab5$knn_result + data_tab5$svm_result + data_tab5$rf_result + data_tab5$xgb_result > 2) {
      data_tab5$conclude <- 1
    } else {
      data_tab5$conclude <- 0
    }
    return(data_tab5$conclude)
  })  

  # Tab 6
  reactive_tab6 <- eventReactive(input$confirm_tab6, {
    
    # Create data frame using user input
    data_tab6 <- data.frame(
      tuoime = input$tuoime_tab6,
      tuoithai = input$tuoithai_tab6,
      tiensusinhconhoichungdown = input$tiensusinhconhoichungdown_tab6,
      dau_duongkinhluongdinh = input$dau_duongkinhluongdinh_tab6,
      dau_chuvidau = input$dau_chuvidau_tab6,
      mat_moimui = input$mat_moimui_tab6,
      nguc_nhiptimthai = input$nguc_nhiptimthai_tab6,
      d_khoangsangsaugay = input$d_khoangsangsaugay_tab6,
      nguc_ditattim = input$nguc_ditattim_tab6,
      chi_chieudaixuongdui = input$chi_chieudaixuongdui_tab6,
      t_mom_afp = input$t_mom_afp_tab6,
      t_mom_hcg = input$t_mom_hcg_tab6,
      t_mom_ue3 = input$t_mom_ue3_tab6
    )
    
    prepro_sash_tk2 <- preProcess(train_sash_tk2, method = c("center", "scale"))
    prepro_data_tab6 <- predict(prepro_sash_tk2, data_tab6)
    
    # Run all 4 models through newly created data frame
    knn_tab6 <- predict(knn_sash_tk2, newdata = prepro_data_tab6, type = "prob")
    svm_tab6 <- predict(svm_sash_tk2, newdata = prepro_data_tab6, type = "prob")
    rf_tab6 <- predict(rf_sash_tk2, newdata = data_tab6, type = "prob")
    xgb_tab6 <- predict(xgb_sash_tk2, newdata = data_tab6, type = "prob")
    
    # Create new variables to determine the risk of having Down Syndrome with each model by compare the result to threshold
    data_tab6$knn_result <- ifelse(knn_tab6[,1] < coords_knn_sash_tk2$threshold, 1, 0)
    data_tab6$svm_result <- ifelse(svm_tab6[,1] < coords_svm_sash_tk2$threshold, 1, 0)
    data_tab6$rf_result <- ifelse(rf_tab6[,1] < coords_rf_sash_tk2$threshold, 1, 0)
    data_tab6$xgb_result <- ifelse(xgb_tab6[,1] < coords_xgb_sash_tk2$threshold, 1, 0)
    
    if (data_tab6$knn_result + data_tab6$svm_result + data_tab6$rf_result + data_tab6$xgb_result == 2) {
      # Create new variables to weight each model based on training accuracy
      data_tab6$knn_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"]*data_tab6$knn_result
      data_tab6$svm_weight <- svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"]*data_tab6$svm_result
      data_tab6$rf_weight <- rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"]*data_tab6$rf_result
      data_tab6$xgb_weight <- xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]*data_tab6$xgb_result
      
      # Create a new variable to get the sum of all model training accuracy
      data_tab6$overall_weight <- knn_sa_tk1$results[which.max(knn_sa_tk1$results$ROC), "Accuracy"] + svm_sa_tk1$results[which.max(svm_sa_tk1$results$ROC), "Accuracy"] + rf_sa_tk1$results[which.max(rf_sa_tk1$results$ROC), "Accuracy"] + xgb_sa_tk1$results[which.max(xgb_sa_tk1$results$ROC), "Accuracy"]
      
      # Create a new variable to get the final decision if the total of weight is higher than half of sum of all training accuracy
      data_tab6$conclude <- ifelse((data_tab6$knn_weight + data_tab6$svm_weight + data_tab6$rf_weight + data_tab6$xgb_weight) / data_tab6$overall_weight > 0.5, 1, 0)
    } else if (data_tab6$knn_result + data_tab6$svm_result + data_tab6$rf_result + data_tab6$xgb_result > 2) {
      data_tab6$conclude <- 1
    } else {
      data_tab6$conclude <- 0
    }
    return(data_tab6$conclude)
  })
  
  # Text output
  output$output_text_tab1 <- renderText({
    conclusion <- reactive_tab1()
    
    if (conclusion == 1) {
      return(i18n$t("The risk of having fetus with Down Syndrome is high."))
    } else {
      return(i18n$t("The risk of having fetus with Down Syndrome is low."))
    }
  })
  
  output$output_text_tab2 <- renderText({
    conclusion <- reactive_tab2()
    
    if (conclusion == 1) {
      return(i18n$t("The risk of having fetus with Down Syndrome is high."))
    } else {
      return(i18n$t("The risk of having fetus with Down Syndrome is low."))
    }
  })
  
  output$output_text_tab3 <- renderText({
    conclusion <- reactive_tab3()
    
    if (conclusion == 1) {
      return(i18n$t("The risk of having fetus with Down Syndrome is high."))
    } else {
      return(i18n$t("The risk of having fetus with Down Syndrome is low."))
    }
  })
  
  output$output_text_tab4 <- renderText({
    conclusion <- reactive_tab4()
    
    if (conclusion == 1) {
      return(i18n$t("The risk of having fetus with Down Syndrome is high."))
    } else {
      return(i18n$t("The risk of having fetus with Down Syndrome is low."))
    }
  })
  
  output$output_text_tab5 <- renderText({
    conclusion <- reactive_tab5()
    
    if (conclusion == 1) {
      return(i18n$t("The risk of having fetus with Down Syndrome is high."))
    } else {
      return(i18n$t("The risk of having fetus with Down Syndrome is low."))
    }
  })
  
  output$output_text_tab6 <- renderText({
    conclusion <- reactive_tab6()
    
    if (conclusion == 1) {
      return(i18n$t("The risk of having fetus with Down Syndrome is high."))
    } else {
      return(i18n$t("The risk of having fetus with Down Syndrome is low."))
    }
  })
  
  observeEvent(input$selected_language, {
    update_lang(input$selected_language)
  })
}

shinyApp(ui, server)