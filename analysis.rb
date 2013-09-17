require 'CSV'

imported_results = CSV.read("/Users/Tung/Desktop/markSixData.csv", 'r', headers: true)
results = []

imported_results.each do |r|
  results << (2..7).to_a.map{ |x| r[x].to_i }
end

tweak_results = []
results.each_with_index do |r, index|
  puts "Result #{index + 1}: #{r.inspect}"
  r.each_with_index do |s, i|
    t = r.clone
    s += 1
    s = 1 if s > 49
    t[i] = s
    if t.uniq.size == t.size
      tweak_results << t
      puts "... Tweak #{i + 1}: #{t.inspect}"
    end
  end
end
tweak_results << results

puts tweak_results.detect{ |e| tweak_results.count(e) > 1 }.inspect
