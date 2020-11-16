#1
#a
sales = readLines("sales.txt")
sales
length(sales) #test how many elements

#b
test = gregexpr("[A-Z].+?}", sales)
splited_test = regmatches(sales, test)
#b = splited_test[[1]][1] + splited_test[[1]][2] + splited_test[[1]][3] + splited_test[[1]][4] + splited_test[[1]][5] + splited_test[[1]][6]
#splitData = splited_test[[1]]
splitData = c(splited_test[[1]][1], splited_test[[1]][2], splited_test[[1]][3], splited_test[[1]][4],splited_test[[1]][5], splited_test[[1]][6])
splitData

#c
#testing = gsub(".*\\{", "AAA", splitData) # test for deleting city name and left bracket
city_sales = gsub(".*\\{(.*)\\}$", "\\1", splitData)
city_sales

#dates1 = gsub("Sales->[0-9]+", "", city_sales)
#dates1
#dates2 = gsub("<\\|\\Date->(.*),|>", "\\1", city_sales)
#dates2
#dates = gsub("^<|Date->(.*),Sales->[0-9]+|>", "\\1", city_sales)
#dates
#dates1 = gsub("<\\|Date->(.* [0-9]+ .* [0-9]+),Sales->[0-9]+\\|>", "\\1", city_sales)
#dates1

plain_data = gsub("<\\|Date->|\\Sales->|\\|>", "", city_sales)
plain_data
extractedData = strsplit(plain_data, ",")
extractedData
head(extractedData[[1]])
tail(extractedData[[1]])


#d

length(extractedData[[1]])
length(extractedData[[2]])
length(extractedData[[3]])
length(extractedData[[4]])
length(extractedData[[5]])
length(extractedData[[6]])
#each elements in the list have the same length


num_of_row = length(extractedData[[1]]) / 2
num_of_col = 3


#Boston_name 
boston = matrix(nrow = num_of_row, ncol = num_of_col)
boston
boston[,1] = "Boston"
boston

#Boston_date 
#as.character(boston_date) 
boston_date = ""
dates_index_boston = grep("^[A-Z]", extractedData[[1]])
#extractedData[[1]][1] # test
#c(boston_date, extractedData[[1]][3]) # test
boston_date = extractedData[[1]][dates_index_boston]
boston_date
boston[,2] = boston_date

#Boston_sales
#as.character(boston_sales)
boston_sales = ""
sales_index_boston = grep("^[0-9]", extractedData[[1]])
boston_sales = extractedData[[1]][sales_index_boston]
boston_sales
boston[,3] = boston_sales

boston


#the above way shows how to process the data in a city
#so I make it as a for loop in order to use less spaces and lines


#by using for loop
city = c("Boston", "New York City", "Paris", "London", "Shanghai", "Tokyo")
salesData = as.list(c(0,0,0,0,0,0))
for (a in 1:6) {
  new_matrix = matrix(nrow = num_of_row, ncol = num_of_col)
  new_matrix[,1] = city[a] # insert city into the first column
  
  new_date_index = grep("^[A-Z]", extractedData[[a]])
  new_date = extractedData[[a]][new_date_index]
  new_matrix[,2] = new_date # insert dates
  
  new_sales_index = grep("^[0-9]", extractedData[[a]])
  new_sales = extractedData[[a]][new_sales_index]
  new_matrix[,3] = new_sales
  
  salesData[[a]] = new_matrix
}
salesData
head(salesData[[1]])
