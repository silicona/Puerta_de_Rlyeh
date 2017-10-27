module FijasHelper
	def inscrito?(id)
		usuario_actual.estudiando.map(&:id).include?(id)
	end
end
