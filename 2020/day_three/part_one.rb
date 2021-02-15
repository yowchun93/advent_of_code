input = File.read(File.expand_path('input03.txt', __dir__))

rows = input.split("\n").map { |line| line.split('')}

x, y, trees = 0,0,0
dx = 3
dy = 1

while y < rows.length - 1
  x += dx
  # modulus operator
  x %= rows[0].length
  y += dy
  if rows[y][x] == '#'
    trees = trees + 1
  end
end

puts trees