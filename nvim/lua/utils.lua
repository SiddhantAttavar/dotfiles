-- Common functions
return {
	contains = function(array, value)
		for _, r in ipairs(array) do
			if r == value then
				return true
			end
		end
		return false
	end
}
