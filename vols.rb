class Vol
	attr_accessor :name
	attr_accessor :start
	attr_accessor :finish
	attr_accessor :price

	def initialize(name, start, finish, price)
		@name = name
		@start = start
		@finish = finish
		@price = price
	end

	def compare(vols)
		vols.each do |vol|
			return false if !(@start > vol.finish || @finish < vol.start)
		end
		return true
	end
end

vols = [Vol.new("AF515", 0, 5, 10),
		Vol.new("AF432", 5, 9, 14),
		Vol.new("C045", 6, 7, 8),
		Vol.new("EARDS", 8, 10, 11),
		Vol.new("VHAE0", 8, 10, 11)]

max = 0
vols.each do |vol|
	vols_ok = [vol]
	vols.count.times do |i|
		if vols[i].compare(vols_ok)
			vols_ok << vols[i]
		end
	end
	total = vols_ok.map(&:price).inject(0, :+)
	max = total if total > max
end

puts "max = #{max}"
