input = File.read(File.expand_path('input03.txt', __dir__))

rows = input.split("\n").map { |line| line.split('')}

total_trees = [[1, 1], [3,1], [5,1], [7,1], [1,2]].reduce(1) do |acum, speed|
  x, y, trees = 0,0,0
  dx, dy = speed
  while y < rows.length - 1
    x += dx
    x %= rows[0].length
    y += dy

    if rows[y][x] == '#'
      trees = trees + 1
    end
  end
  acum * trees
end

puts total_trees