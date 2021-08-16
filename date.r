ml = c(31,28,31,30,31,30,31,31,30,31,30,31)

date = 100 # example
month_count = 1

for (i in ml) 
{
  if (date > 0)
  {
    date = date - i
    if (date < 0)
    {
      date = date + i
      break
    }
    month_count = month_count + 1
  }
}

print(date)
print(month_count)

day = date
month = month_count
year = 2021

cat(sprintf("Date: %d/%d/%d\n", day, month, year))
