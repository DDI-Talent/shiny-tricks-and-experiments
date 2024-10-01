# Shiny Experiments

## [1. How to access url variables inside of shiny app (R) ](./shiny-using-url-variables)

- in R use:

```
library(urltools)
result <- param_get(session$clientData$url_search, c("color","name"))
```

- in Python use:

```
url_query = session.input[".clientdata_url_search"]()
url_variables = {}
for key_value_string in url_query[1:].split("&"):
    key, value = key_value_string.split("=")
    url_variables[key] = value
```