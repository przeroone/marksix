require 'CSV'

imported_results = CSV.read("/Users/Tung/Desktop/markSixData.csv", 'r', headers: true)
results = []

imported_results.each do |r|
  results << (2..7).to_a.map{ |x| r[x].to_i }
end

puts results.detect{ |e| results.count(e) > 1 }
