## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message = FALSE---------------------------------------------------
# library(devtools)
# use "quiet = FALSE" if you want to see the outputs of this command
# devtools::install_github("juancolonna/FastStepGraph", quiet = TRUE, force = TRUE)

# Then, load it:
library(FastStepGraph)

# If you directly cloned the github repository, 
# then you should uncomment these lines to load the functions:
# source('FastStepGraph.R')
# source('SigmaAR.R')

## -----------------------------------------------------------------------------
set.seed(1234567)
phi <- 0.4 
p <- 50  # number of variables (dimension)
n <- 30 # number of samples

# Generate Data from a Gaussian distribution 
data <- FastStepGraph::SigmaAR(n, p, phi)

## -----------------------------------------------------------------------------
t0 <- Sys.time() # INITIAL TIME
G <- FastStepGraph::FastStepGraph(data$X, alpha_f = 0.22, alpha_b = 0.14)
difftime(Sys.time(), t0, units = "secs")
# print(G$Omega)

## -----------------------------------------------------------------------------
t0 <- Sys.time() # INITIAL TIME
res <- FastStepGraph::cv.FastStepGraph(data$X, data_shuffle = FALSE)
difftime(Sys.time(), t0, units = "secs")

# print(res$alpha_f_opt)
# print(res$alpha_b_opt)
# print(res$Omega)

## ---- eval=FALSE--------------------------------------------------------------
#  t0 <- Sys.time() # INITIAL TIME
#  # use 'n_cores = NULL' to set the maximum number of cores minus one on your machine
#  res <- FastStepGraph::cv.FastStepGraph(data$X, parallel = TRUE, n_cores = 2)
#  difftime(Sys.time(), t0, units = "secs")
#  
#  # print(res$alpha_f_opt)
#  # print(res$alpha_b_opt)
#  # print(res$Omega)

