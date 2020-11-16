#Q1
# --- before using funciton ---
# --- test ---
overall_data = readLines("summer.html")
#overall_data
overall_data[111] # test

table_location = grep("<caption>2016 Summer Olympics medal table</caption>", overall_data) # find the location of string of the metal table
table_location
table = overall_data[table_location]
table  

#country_pattern = gregexpr(".*(\\([A-Z]+\\)).*?(</tr>)", table)
country_pattern = gregexpr("(\\([A-Z]+\\)).*?(</tr>)", table)
country_pattern

countries_data_string = regmatches(table, country_pattern)
countries_data_string = unlist(countries_data_string)
countries_data_string

countries_data_string[1]

#test
test = gsub("</span></th><td>", " ", countries_data_string[1])
test = gsub("</td><td>", " ", test)
test = gsub("</td></tr>", "", test)
test

#modify all countries
metal_data = gsub("</span>.*</th><td>", " ", countries_data_string)
metal_data = gsub("</td><td>", " ", metal_data)
metal_data = gsub("</td></tr>", "", metal_data)
metal_data

#test_matrix = rbind(metal_data)
#test_matrix
#metal_data = list(metal_data)
#test_matrix = do.call(rbind, metal_data)
#head(test_matrix)

metal_data[1]
test = strsplit(metal_data[1], " ")
test = unlist(test)
test

metal_data_split = strsplit(metal_data, " ")
metal_data_split = unlist(metal_data_split)
metal_data_split

metal_matrix = matrix(metal_data_split, ncol = 5, byrow = T)

colnames(metal_matrix) = c('V1', 'V2', 'V3', 'V4', 'V5')
rownames(metal_matrix) = 1:86

metal_frame = data.frame(metal_matrix)

metal_frame
head(metal_frame)
# --- End of test---

# --- organise as function: --- 
process_function = function(filename) {
  overall_data = readLines(filename)
  table_location = grep("<caption>2016 Summer Olympics medal table</caption>", overall_data) # find the location of string of the metal table
  table = overall_data[table_location]
  country_pattern = gregexpr("(\\([A-Z]+\\)).*?(</tr>)", table)
  countries_data_string = regmatches(table, country_pattern)
  countries_data_string = unlist(countries_data_string)
  metal_data = gsub("</span>.*</th><td>", " ", countries_data_string)
  metal_data = gsub("</td><td>", " ", metal_data)
  metal_data = gsub("</td></tr>", "", metal_data)
  metal_data_split = strsplit(metal_data, " ")
  metal_data_split = unlist(metal_data_split)
  metal_matrix = matrix(metal_data_split, ncol = 5, byrow = T)
  colnames(metal_matrix) = c('V1', 'V2', 'V3', 'V4', 'V5')
  rownames(metal_matrix) = 1:86
  metal_frame = data.frame(metal_matrix)
  #metal_frame
  print(head(metal_frame))
}


extraction = process_function("summer.html")


#Q2