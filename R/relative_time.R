#' Relative time
#'
#' @param datetime A POSIXct scalar
#' @param usetz Whether to use the timezone or not
#'
#' @return A tag list element
#' @export
#' 
#' @import htmltools
#'
#' @examples
#' relative_time(Sys.time())
relative_time <- function(datetime, usetz = FALSE, class = NULL) {
  
  dt <-  lubridate::format_ISO8601(datetime, usetz = usetz)
  
  tagList(
    dep_luxon(),
    dep_relative_time(),
    
    div(
      class = "luxon-relative-time",
      class = class,
      "relative-time" = dt
    )
  )
}

dep_luxon <- function() {
  htmlDependency(
    name = "luxon", 
    version = "3.2.0", 
    src = "htmlwidgets/luxon",
    script = "luxon.min.js", 
    package = "luxonJS"
  )
}

dep_relative_time <- function() {
  htmlDependency(
    name = "relative_time", 
    version = "3.2.0", 
    src = "htmlwidgets",
    script = "relative_time.js", 
    package = "luxonJS"
  )
}




