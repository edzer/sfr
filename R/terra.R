# see https://github.com/r-spatial/sf/issues/1567
#' @export
st_as_sf.SpatVector = function(x, ..., hex = TRUE) {
	if(!requireNamespace("terra", quietly = TRUE))
		stop("package terra required, please install it first")
	if (!utils::packageVersion("terra") >= "1.1-5")
		stop("package terra version 1.1-5 required")
	d <- terra::as.data.frame(x, geom = "hex")
	d$geometry <- structure(as.list(d$geometry), class = "WKB")
	st_as_sf(d, crs = x@ptr$get_crs("wkt"))
}

#' @export
st_crs.SpatRaster = function(x, ...) {
	if (!requireNamespace("terra", quietly = TRUE))
		stop("package terra required, please install it first") # nocov
	st_crs(terra::crs(x))
}

#' @export
st_crs.SpatVector = function(x, ...) {
	if (!requireNamespace("terra", quietly = TRUE))
		stop("package terra required, please install it first") # nocov
	st_crs(terra::crs(x))
}
