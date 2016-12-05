-- 
	return
	{
		LastError = nil,
		InstructionSet = require('RecipeInstructionSet'),

		GetRecipeList = function()
		--function GetRecipeList()
			Files = file.list()
			Recipes = {}

			-- Revisamos que los archivos no esten vacios y empiezen por 'recipe_'
			for Name, Size in pairs(Files) do
				if Size > 0 and Name:sub(1, 7) == 'recipe_' then
					Recipes[#Recipes + 1] = Name:sub(8)
				end
			end

			return Recipes
		end,

		ParseRecipe = function(RecipeName)
			-- Si el nombre es string (nombre de archivo valido)
			if type(RecipeName) == 'string' then
				-- Si podemos abrir el archivo
				if file.open('recipe_' .. RecipeName, 'r') then
					-- Recorremos el archivo linea por linea y lo parseamos
					while true do
						Line = file.readline()

						if Line ~= nil then
							-- Eliminamos los saltos de linea
							Line = Line:gsub('\r', '')
							Line = Line:gsub('\n', '')
							print(Line)
						else
							break
						end
					end
				else
					print('RecipeManager: recipe_' .. RecipeName .. ': No such file')
				end
			else
				print('RecipeManager: RecipeName must of type string (instead of ' .. type(RecipeName) .. ')')
			end

			return nil
		end,

		GetLastError = function()
			E = LastError
			LastError = nil
			return E
		end
	}