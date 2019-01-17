# This is a function for stopping a production style script with an error message put out to
# the screen and to the stdout.
stopError <- function(func_errMessage, func_qError = options()$quit_onError,
						func_outDir = if(is.element("outDir",ls(,pos=".GlobalEnv"))){ outDir } else { paste(getwd(),"/",sep="") }){
	cat(paste("Error: ",func_errMessage, " on - ",Sys.time()," \n",sep=""),
		file = paste(func_outDir,"errorMessage_",Sys.Date(),".txt",sep=""),
		sep="\n",
		append = TRUE)
	if(func_qError){
		q(save="no")
	} else {
		stop(func_errMessage, call. = FALSE)
	}
}
## This function relies on certain global options existing,
options(quit_onError = TRUE)