
class Palabra < String
	def palindromo?(string)
		string == string.reverse
	end

	def soy_palindramo?
		self == self.reverse
		#self == reverse
	end

	def length
		"Tengo #{self.length} caracteres"
	end
end

class String
	def string_palindromo?
		self == self.reverse
	end

	def barajear
		self.split('').to_a.shuffle.join
	end

end


class Usuario_prueba
	attr_accessor :nombre, :email, :digest

	def initialize(atributos = {})
		@nombre = atributos[:nombre]
		@email = atributos[:email]
		@digest = atributos[:digest] || (0..15).map {(65 + rand(26)).chr.downcase}.join
	end

	def ver
		inspect
	end

	def emailConFormato
		"#{@nombre} <#{@email}>"
	end
end

class Aula
	def initialize(estudiantes)
		@estudiantes = estudiantes
	end

	def listar_nombres
		@estudiantes.map(&:nombre).join(', ')
	end
end

###############################################################################
	# Argumentos en definiciones

def metodo(arg1 = "Primero", arg2 = "Segundo", arg3 = "Tercero")
	"#{arg1}, #{arg2}, #{arg3}."
end

puts metodo
puts metodo "Con Ruby sabe mejor"

def foo(*mi_cadena)
	mi_cadena.each do |palabra|
		puts palabra
	end
end

foo('hola', 'mundo')
puts "Foo a secas"
foo()

def sumando_argumentos(a = 99, b = a + 1)
	[a, b]
end

puts sumando_argumentos
puts sumando_argumentos(22,33)

#############################################################################
	# Test

def crear_preguntas
	examen = []
	10.times do |n|
		examen << (n.odd? ? Faker::HitchhikersGuideToTheGalaxy.marvin_quote :	Faker::ChuckNorris.fact)
	end
	examen.join(' ')
end

#############################################################################
	# Rspec

# describe Aula do
# 	it 'La lista de alumnos deberia funcionar correctamente' do
# 		estu1 = double('estu')
# 		estu2 = double('estu')

# 		allow(estu1).to receive(:nombre) { 'Juan'}
# 		allow(estu2).to receive(:nombre) { 'Sara'}

# 			# Obsoleto
# 		#estu1.stub(:nombre).and_return('Juan')
# 		#estu2.stub(:nombre).and_return('Sara')

# 		aula = Aula.new [estu1, estu2]
# 		expect(aula.listar_nombres).to eq('Juan, Sara')
# 	end

# 	it "La lista funciona con Usuarios de prueba" do
# 		sara = Usuario_prueba.new(nombre: 'Sara')
# 		juan = Usuario_prueba.new(nombre: 'Juan')

# 		aula = Aula.new [sara, juan]
# 		expect(aula.listar_nombres).to eq("#{sara.nombre}, #{juan.nombre}")
# 	end
# end

# describe Usuario_prueba do
# 	before(:each)do
# 		@usuario = Usuario_prueba.new
# 	end

# 	it "Usuario solo con digest" do
# 		expect(@usuario).to_not be_nil
# 		expect(@usuario.digest).to_not be false
# 	end

# 	it "Usuario se da nombre" do
# 		expect(@usuario.nombre).to be_nil
# 		@usuario.nombre = "Jason"
# 		expect(@usuario.nombre).to eq('Jason')
# 	end
# end

#####################################################################
	# RegExp

# FormatoImagenes = /(\.jpg|\.jpeg|\.png|\.gif)/
# extension = ".jpg"
# if FormatoImagenes =~ extension
# 	puts "conseguido"
# end

PruebaReg = /\|/
apunte = "Las clases son un poco intensas para mi gusto.|Las clases son demasiado pequeñas."
apunte = apunte.split(PruebaReg)
puts apunte

# while trozo = FormatoApuntes.match(apunte)
# 	puts "Trozo: " + trozo.to_s
# end
# puts FormatoApuntes.match(apunte)

puts "La reg es /y/ o %r{y}"
puts "La coincidencia en 'Haystack' es " + /y/.match('Haystack').to_s
puts "La coincidencia en 'Haystack' es " + %r{y}.match('Haystack').to_s

#####################################################################
	# capybara cheat sheet
#####################################################################

# =Navigating=
#     visit('/projects')
#     visit(post_comments_path(post))

# =Clicking links and buttons=
#     click_link('id-of-link')
#     click_link('Link Text')
#     click_button('Save')
#     click('Link Text') # Click either a link or a button
#     click('Button Value')

# =Interacting with forms=
#     fill_in('First Name', :with => 'John')
#     fill_in('Password', :with => 'Seekrit')
#     fill_in('Description', :with => 'Really Long Text…')
#     choose('A Radio Button')
#     check('A Checkbox')
#     uncheck('A Checkbox')
#     attach_file('Image', '/path/to/image.jpg')
#     select('Option', :from => 'Select Box')

# =scoping=
#     within("//li[@id='employee']") do
#       fill_in 'Name', :with => 'Jimmy'
#     end
#     within(:css, "li#employee") do
#       fill_in 'Name', :with => 'Jimmy'
#     end
#     within_fieldset('Employee') do
#       fill_in 'Name', :with => 'Jimmy'
#     end
#     within_table('Employee') do
#       fill_in 'Name', :with => 'Jimmy'
#     end

# =Querying=
#     page.has_xpath?('//table/tr')
#     page.has_css?('table tr.foo')
#     page.has_content?('foo')
#     page.should have_xpath('//table/tr')
#     page.should have_css('table tr.foo')
#     page.should have_content('foo')
#     page.should have_no_content('foo')
#     find_field('First Name').value
#     find_link('Hello').visible?
#     find_button('Send').click
#     find('//table/tr').click
#     locate("//*[@id='overlay'").find("//h1").click
#     all('a').each { |a| a[:href] }

# =Scripting=
#     result = page.evaluate_script('4 + 4');

# =Debugging=
#     save_and_open_page

# =Asynchronous JavaScript=
#     click_link('foo')
#     click_link('bar')
#     page.should have_content('baz')
#     page.should_not have_xpath('//a')
#     page.should have_no_xpath('//a')

# =XPath and CSS=
#     within(:css, 'ul li') { ... }
#     find(:css, 'ul li').text
#     locate(:css, 'input#name').value
#     Capybara.default_selector = :css
#     within('ul li') { ... }
#     find('ul li').text
# locate('input#name').value




# w = Palabra.new
# puts "foobar: " + w.palindromo?('foobar').to_s

# w = Palabra.new('abracacabra')

# puts "soy: " + w.soy_palindramo?.to_s

# e = "deified".string_palindromo?.to_s
# puts "deified es un string palindromo: " + e

# e = "foobar".barajear
# puts "barajear: " + e

# puts "Clase usuario"

###############################################################################
	# Clase Usuario

# usuario = Usuario_prueba.new
# puts "Usuario: " + usuario.ver
# usuario_con_datos = Usuario_prueba.new(nombre: "Pepe", email: "miemail@dominio.com", digest: "mi propio digest")
# puts "Con datos: " + usuario_con_datos.ver
# puts "Digest: " + usuario_con_datos.digest
# puts "Con formato:", usuario_con_datos.emailConFormato

	### De apartado Seguir y dejar de seguir ###
	# arrays siguiendo y seguidores
# Usuario.first.seguidores.count
# Usuario.first.seguidores.to_a.count
# Usuario.first.siguiendo.map(&:id)


######################################
######################################
# Ejecutando en consola:

# puts "Bloques".upcase
# (1..5).each { |i| puts 2 * i }
# "=> 1..5"

# (1..5).each do |i|
# 	puts 2 * i
#   puts '--'
# end
# a.push(6)                  # Pushing 6 onto an array
# => [42, 8, 17, 6]
# a << 7                     # Pushing 7 onto an array
# => [42, 8, 17, 6, 7]
# a << "foo" << "bar"        # Chaining array pushes
# => [42, 8, 17, 6, 7, "foo", "bar"]

# ('a'..'e').to_a
# => ["a", "b", "c", "d", "e"]

# Convierte strings en un array:
# %w[foo bar baz] => ["foo", "bar", "baz"]

# direcciones = %w[miemail2jaja.com soyunico@mail.com pepe@mail.com]
# 	direcciones.each do |direccion|
# 	puts direccion
# end

# 3.times { puts "Betelgeuse!" }   # 3.times takes a block with no variables.
# "Betelgeuse!"
# "Betelgeuse!"
# "Betelgeuse!"
# => 3
# (1..5).map { |i| i**2 }          # The ** notation is for 'power'.
# => [1, 4, 9, 16, 25]
# %w[a b c]                        # Recall that %w makes string arrays.
# => ["a", "b", "c"]
# %w[a b c].map { |char| char.upcase }
# => ["A", "B", "C"]
# %w[A B C].map { |char| char.downcase }
# => ["a", "b", "c"]

# As you can see, the map method returns the result of applying the given block to each element in the array or range. In the final two examples, the block inside map involves calling a particular method on the block variable, and in this case there’s a commonly used shorthand called “symbol-to-proc”:

# %w[A B C].map { |char| char.downcase }
# => ["a", "b", "c"]
# %w[A B C].map(&:downcase)
# => ["a", "b", "c"]

# Cadena aleatoria
# ('a'..'z').to_a.shuffle[0..7].join

# Apartado Flash
# flash = { exito: "Funciona", error: "Fracaso"}
# flash.each do |llave, valor|
# 	puts "#{llave}"
# 	puts "#{valor}"
# end

# Url Segura
# SecureRandom.urlsafe_base64

# a=[1,2,3]
# a.length => 3
# a.send(:length) => 3
# a.send('length') => 3
	# Empleado en el modelo Usuario#autentificado?
# usuario = Usuario.first
# usuario.digest_activacion => "$2a$10$KApqwdMeBqNSSU6jrst5HOB1YfQVzUA51jZr5TVHAX4fijndBiwoq"
# usuario.send(:digest_activacion) => "$2a$10$KApqwdMeBqNSSU6jrst5HOB1YfQVzUA51jZr5TVHAX4fijndBiwoq"
# usuario.send('digest_activacion') => "$2a$10$KApqwdMeBqNSSU6jrst5HOB1YfQVzUA51jZr5TVHAX4fijndBiwoq"
# atributo = :activacion
# usuario.send("digest_#{activacion}") => "$2a$10$KApqwdMeBqNSSU6jrst5HOB1YfQVzUA51jZr5TVHAX4fijndBiwoq"

# Escritura Lambda - funcion sin nombre
# -> { puts "foo"}
# 	=> #<Proc:0x....
# 	# Evaluar la funcion
# -> { puts "foo" }.call
# 	foo
# 	=> nil