#' Print Survival Model Performance
#'
#' @param x a model to be explained, object of the class 'model_performance_explainer'
#' @param times a vector of integer times on which we want to check the value of prediction error
#' @param ... further arguments passed to or from other methods
#'
#' @export

print.surv_model_performance_explainer <- function(x, times = NULL, ...) {
  if (is.null(times)) times <- sort(attributes(x)$time)[1:10]

  x <- as.data.frame(x)
  x <- x[!duplicated(x$time),]
  x <- x[which(x$time %in% times),]
  rownames(x) <- NULL
  colnames(x)[2] <- "prediction error"
  x$`prediction error` <- x$`prediction error` * 100
  x$`prediction error` <- round(x$`prediction error`, digits = 2)
  x$`prediction error` <- paste0("~ ", x$`prediction error`, "%")

  type <- attributes(x)$type
  if (type == "BS") type <- "Brier Score"


  cat(paste("Model performance for", type, "method."))
  cat("\n")
  print(x[,c("time","prediction error")])
}
