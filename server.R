shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    N=as.numeric(input$n_breaks)
    bandwidth=input$bw_adjust
    rg=abs(as.numeric(input$range))
    bins=as.numeric(input$bins)
    
 
    
    if(input$type=="normal"){
      rdata=rnorm(N,input$mu,input$sigma)
      titletx="Normal"
    }
    if(input$type=="chisq"){
      rdata=rchisq(N,input$df)
      titletx="Chisq"
    }
    if(input$type=="beta"){
      rdata=rbeta(N,input$beta.alpha,input$beta.beta,ncp=input$beta.delta)
      titletx="Beta"
    }
    if(input$type=="gamma"){
      rdata=rgamma(N,input$gamma.alpha,input$gamma.beta,ncp=input$gamma.delta)
      titletx="Gamma"
    }
    if(input$type=="f"){
      rdata=rf(N,input$f.alpha,input$f.beta,ncp=input$f.delta)
      titletx="F"
    }
    if(input$type=="t"){
      rdata=rt(N,input$t.DOF,ncp=input$t.delta)
      titletx="T"
    }
    if(input$type=="exp"){
      rdata=rexp(N,input$exp.beta)
      titletx="Exponential"
    }
    if(input$type=="cauchy"){
      rdata=rcauchy(N,input$cauchy.mu,input$cauchy.sigma)
      titletx="Cauchy"
    }
    if(input$type=="pois"){
      rdata=rpois(N,input$pois.lambda)
      titletx="Poisson"
    }
    if(input$type=="binom"){
      rdata=rbinom(N,input$binom.n,input$binom.p)
      titletx="Binomial"
    }
    #Below are universal plotting code.
    hist(rdata,
         probability = TRUE,
         nclass=bins,
         xlim = c(-rg,rg),
         xlab = "Value",
         main = titletx)
    
    if (input$individual_obs) {
      rug(rdata)
    }
    par(lwd = 2)
    dens <- density(rdata, adjust = bandwidth)
    lines(dens, col = "blue",)
    
  })
})