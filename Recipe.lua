--[[ Este objeto (Recipe) se encarga de manejar todo lo relacionado a una receta una vez que fue iniciada. 
	 Se encarga de pasarle los datos necesarios a Setup() y Check() dentro de cada set de instrucciones
	 y de actualizar el servidor web. 
	]]

	Recipe = {}

	function Recipe.new()
		local Recipe = {}

		local Instructions = {}

		function Recipe.AddInstruction(I)
			Instructions[#Instructions + 1] = {}

			Instructions[#Instructions].Instruction = I
			Instructions[#Instructions].Arguments = {}

			return #Instructions
		end

		function Recipe.AddArgument(InstructionIndex, A)
			Instructions[InstructionIndex].Arguments[#(Instructions[InstructionIndex].Arguments) + 1] = A
		end

		return Recipe
	end