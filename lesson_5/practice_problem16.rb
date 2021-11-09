require 'pry-byebug'

def UUID()
  chars = []
  10.times {|int| chars << int}
  ('a'..'f').each {|char| chars << char}

  sections = [8,4,4,12]
  uuid = ''

  # sections.each do |section|
  #   count = 0
  #   section.times do
  #     uuid += chars.sample.to_s
  #     count += 1
  #   end
  #   uuid += '-' if count <= section.size - 1
  # end
  sections.each_with_index do |section, index|
    binding.pry
    section.times { uuid += chars.sample.to_s}
    uuid += '-' unless index >= sections.size - 1
  end
  
  uuid
end

p UUID()