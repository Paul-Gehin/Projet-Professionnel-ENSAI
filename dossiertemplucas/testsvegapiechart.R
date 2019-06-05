devtools::install_github("hrbrmstr/vegalite")

library(vegalite)

# current verison
packageVersion("vegalite")

vegalite() %>% 
  view_size(400,400) %>% 
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>% 
  encode_x("Weight_in_lbs") %>% 
  encode_y("Displacement") %>% 
  encode_color("Origin", "nominal") %>% 
  mark_point()

dat <- jsonlite::fromJSON('[
    {"a": "A","b": 15}, {"a": "B","b": 15}, {"a": "C","b": 10},
    {"a": "D","b": 15}, {"a": "E","b": 5}, {"a": "F","b": 10},
    {"a": "G","b": 15}, {"a": "H","b": 5}, {"a": "I","b": 10}
  ]')

vegalite() %>%
  add_data(dat) %>%
  encode_x("a", "ordinal") %>%
  encode_y("b", "quantitative") %>%
  mark_bar()->test

to_spec(test)-> testresult

from_spec(testresult)


from_spec('https://api.myjson.com/bins/1ailcb')
