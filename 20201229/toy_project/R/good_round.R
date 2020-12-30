#' Better rounding in R
#' 
#' Use sprintf to do smarter rounding that does not drop zeros and
#' formats small p-values properly.
#' 
#' @param x A numeric number that you wish to round
#' @param digits The number of digits to round to
#' @param pval Is the number a p-value? For small p-values, will 
#' return e.g., \code{"<0.001"} rather than \code{0.000}.
#' @return A numeric (or sometimes for p-values, string) rounded
#' version of \code{x}.

good_round <- function(x, digits = 2, pval = FALSE){
	# just use round otherwise
	stopifnot(digits > 1)
	stopifnot(length(digits) == 1)
	if(pval){
		stopifnot(x >= 0 & x <= 1)
	}
	tmp <- sprintf(paste0("%.", digits, "f"), x)
    zero <- paste0("0.", paste0(rep("0", digits), collapse = ""))
    tmp[tmp == paste0("-", zero)] <- zero
    if(pval & tmp == zero){
    	tmp <- paste0("<0.", paste0(rep("0", digits - 1), collapse = ""), "1", 
    	              collapse = "")
    }
    return(tmp)
}