shinyUI(bootstrapPage(
  plotOutput(outputId = "main_plot", height = "300px"),
  # Display density
  selectInput(inputId = "type",
              label = "Distribution:",
              choices = c("normal","chisq","beta","gamma","f","t","exp","cauchy","pois","binom"),
              selected = "normal"),
  numericInput(inputId = "range", "Range:", 10),
  numericInput(inputId = "n_breaks", label="Number of observations to view:", 1000),
  
  checkboxInput(inputId = "individual_obs",
                label = strong("Show individual observations"),
                value = FALSE),
  
  sliderInput(inputId = "bw_adjust",label = "Bandwidth adjustment:",min = 0.2, max = 2, value = 1, step = 0.2),
  sliderInput(inputId = "bins",label = "Bins:",min = 10, max = 1000, value = 10, step = 10),

  #Conditional Panels
  conditionalPanel(condition = "input.type=='normal'",
    sliderInput(inputId = "mu", label = "parameter mu:", min = -5, max = 5, value = 0, step = 0.2),
    sliderInput(inputId = "sigma", label = "parameter sigma:", min = 0.2, max = 5, value = 1, step = 0.2)
  ),
  
  conditionalPanel(condition = "input.type=='chisq'",
    sliderInput(inputId = "df", label = "parameter DOF:", min = 0.2, max = 50, value = 0, step = 0.2)
  ),
  
  conditionalPanel(condition = "input.type=='beta'",
                   sliderInput(inputId = "beta.alpha", label = "parameter alpha:", min = 0.2, max = 5, value = 0.2, step = 0.2),
                   sliderInput(inputId = "beta.beta", label = "parameter beta:", min = 0.2, max = 5, value = 1, step = 0.2),
                   numericInput(inputId = "beta.delta", "noncentral parameter:", 0)
  ),
  
  conditionalPanel(condition = "input.type=='gamma'",
                   sliderInput(inputId = "gamma.alpha", label = "parameter alpha:", min = 0.2, max = 5, value = 0.2, step = 0.2),
                   sliderInput(inputId = "gamma.beta", label = "parameter beta:", min = 0.2, max = 5, value = 1, step = 0.2),
                   numericInput(inputId = "gamma.delta", "noncentral parameter:", 0)
  ),
  
  conditionalPanel(condition = "input.type=='f'",
                   sliderInput(inputId = "f.alpha", label = "parameter alpha:", min = 0.2, max = 10, value = 0.2, step = 0.2),
                   sliderInput(inputId = "f.beta", label = "parameter beta:", min = 0.2, max = 100, value = 1, step = 0.2),
                   numericInput(inputId = "f.delta", "noncentral parameter:", 0)
  ),
  
  conditionalPanel(condition = "input.type=='t'",
                   sliderInput(inputId = "t.DOF", label = "parameter DOF:", min = 0.2, max = 50, value = 0.2, step = 0.2),
                   numericInput(inputId = "t.delta", "noncentral parameter:", 0)
  ),
  
  conditionalPanel(condition = "input.type=='exp'",
                   sliderInput(inputId = "exp.beta", label = "parameter beta:", min = 0.2, max = 50, value = 0.2, step = 0.2)
  ),
  
  conditionalPanel(condition = "input.type=='cauchy'",
                   sliderInput(inputId = "cauchy.mu", label = "parameter mu:", min = -5, max = 5, value = 0, step = 0.2),
                   sliderInput(inputId = "cauchy.sigma", label = "parameter sigma:", min = 0.2, max = 10, value = 1, step = 0.2)
  ),
  conditionalPanel(condition = "input.type=='pois'",
                   sliderInput(inputId = "pois.lambda", label = "parameter lambda:", min = 0.2, max = 10, value = 0.2, step = 0.2)
  ),
  conditionalPanel(condition = "input.type=='binom'",
                   sliderInput(inputId = "binom.n", label = "parameter n:", min = 0, max = 100, value = 5, step = 1),
                   sliderInput(inputId = "binom.p", label = "parameter p:", min = 0, max = 1, value = 0.5, step = 0.01)
  )
  
))