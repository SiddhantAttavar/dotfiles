-- Common functions
return {
	-- Function to check whether a file exists
	file_exists = function(path)
		local file = io.open(path, 'r')
		if file ~= nil then
			io.close(file)
			return true
		else
			return false
		end
	end
}
