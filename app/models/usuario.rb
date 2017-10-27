class Usuario < ApplicationRecord

	before_save :formatear_atributos

	has_many :matriculas, class_name:"Inscripcion",
												foreign_key: "alumno_id",
												dependent: :destroy

  has_many :estudiando, through: :matriculas, source: :aula

	attr_accessor :token_recuerda
	
	validates :nombre, #presence: { message: "está en blanco" },
										 #length: { maximum: 25 },
										 #uniqueness: true
										 uniqueness: { case_sensitive: false, message: "ya está registrado" }

	has_secure_password

	validates_each :nombre do |registro, atributo, valor|
		registro.errors.add(atributo, "está en blanco") if valor.blank?
		registro.errors.add(atributo, "es demasiado largo") if !valor.blank? && valor.length > 25
	end

	validates :password, presence: { message: "está en blanco" },
											 length: { minimum: 8, too_short: "debe tener por lo menos 8 caracteres",
											 					 maximum: 25, too_long: "debe tener como máximo %{count} caracteres" },
											 format: { with: RegexpPass, message: "debe contener letras y números" },
											 allow_nil: true


	with_options if: :matriculado? do |matricula|
		matricula.validates_each :email, :ciudad, :pais do |registro, atributo, valor|
				registro.errors.add(atributo, "está en blanco") if valor.blank?
				registro.errors.add(atributo, "es demasiado largo") if !valor.blank? && valor.length > 35
		end	

		matricula.validates :email, format: { with: RegexpEmail, message: "no es válido" },
																uniqueness: { case_sensitive: false, message: "ya está registrado" },
																allow_nil: true
	end
		
	with_options if: :residente? do |residente|
		residente.validates_each :residencia do |registro, atributo, valor|
			registro.errors.add(atributo, "está en blanco") if valor.blank?
			registro.errors.add(atributo, "es demasiado largo") if !valor.blank? && valor.length > 12
		end
	end

	mount_uploader :imagen, AvatarUploader

		# Creando digest
	class << self

		def digest(string)
			coste = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: coste)
		end

		def nuevo_token
			SecureRandom.urlsafe_base64
		end
	end

	def recordar
		self.token_recuerda = Usuario.nuevo_token
		update_attribute(:digest_recuerda, Usuario.digest(token_recuerda))
	end

	def olvidar
		update_columns(digest_recuerda: nil, digest_activacion: nil)
	end

	def autentificado?(atributo, token)
		digest = send("digest_#{atributo}")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	# def tiene_imagen?
	# 	!self.imagen.nil?
	# end

	# def admin?
	# 	self.admin
	# end

		### Métodos de Modelo y de Vista mostrar ###
	def matriculado?
		self.matriculado
	end

	def residente?
		self.residente
	end

	def editando?
		!!/editar_perfil/.match(request.original_url)
	end

		### Inscribirse en una asignatura ###
	def inscribirse(asignatura)
		matriculas.create(aula_id: asignatura.id)
	end

	def abandonar(asignatura)
		estudiando.delete(asignatura)
	end

	def estudiando?(asignatura)
		estudiando.include?(asignatura)
	end

	def examinado?(asignatura)
		!matriculas.find_by(aula_id: asignatura).nota.nil?
	end

	def nota(asignatura)
		matriculas.find_by(aula_id: asignatura).nota
	end

	private
		def formatear_atributos
			self.nombre = nombre.downcase
			if !self.email.nil?
				self.email = email.downcase
			end
		end
end
