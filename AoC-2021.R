#### Day 1 ####
input= as.integer(readLines("inputs/day1"))
sum(c(FALSE, diff(input) > 0))



#### Day 2 ####
library(stringr)

input = readLines("inputs/day2")
input_list = str_split(input, ' ')

hor = 0
dep = 0

for (i in input_list) {
  print(i)
  
  if (i[1] == 'forward') {
    hor = hor + as.integer(i[2])
  } else if (i[1] == 'down') {
    dep = dep + as.integer(i[2])
  } else {
    dep = dep - as.integer(i[2])
  }

}

hor* dep
  


### Day 3 ####
library(stringr)
library(purrr)

input = readLines("inputs/day3")
input_list = str_split(input, "")

n_char = nchar(input[1])
rounds_list = list()

# create a list of consecutive elements of the string where 1st element of the list stores first characters of all strings, 2nd element of the list stores all the second characters and so on.
for (i in 1:n_char) {
  round = unlist(map(input_list, function(x){x[i]}))
  rounds_list = append(rounds_list, list(as.integer(round)))
}

# add all the elements and if the sum>500 then 1 is the most common element, otherwise 0
sum_list = map(rounds_list, sum)

gamma_binary = unlist(map(sum_list, function(x){x>500}))
epsilon_binary = paste(as.integer(!gamma_binary), collapse="")
gamma_binary = paste(as.integer(gamma_binary), collapse = "")

# convert binaries to decimal
gamma = strtoi(gamma_binary, base = 2)
epsilon = strtoi(epsilon_binary, base = 2)

gamma*epsilon