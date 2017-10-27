class FijasController < ApplicationController
  before_action :sesion_iniciada, only: [:claustro, :lugares]
  before_action :obtener_docentes, only: [:claustro]

  def inicio
  end

  def colegio
  end

  def claustro
    @profesores = @docentes || Profesor.all
    @noticias = ["Quo usque tandem abutere, Catilina, patientia nostra? quam diu etiam furor iste tuus nos eludet?", 
                 "O tempora, o mores! Senatus haec intellegit. Consul videt; hic tamen vivit. Vivit?",
                 "Catilinam orbem terrae caede atque incendiis vastare cupientem nos consules perferemus?"]
  end

  def lugares
    unless @usuario.nil?
      @edificios = []
      asignaturas = @usuario.estudiando
      unless asignaturas.nil?
        @usuario.estudiando.map {|asi| @edificios << "#{nominalizar(asi.nombre)} - Edificio #{asi.edificio}" }
      end
    end
  	# sin usuario, instalaciones
  end

  def secretaria
    @asignaturas = Asignatura.all
    @noticias = ["Quo usque tandem abutere, Catilina, patientia nostra? quam diu etiam furor iste tuus nos eludet?", 
                 "O tempora, o mores! Senatus haec intellegit. Consul videt; hic tamen vivit. Vivit?",
                 "Catilinam orbem terrae caede atque incendiis vastare cupientem nos consules perferemus?",
                 "Quo usque tandem abutere, Catilina, patientia nostra? quam diu etiam furor iste tuus nos eludet?", 
                 "O tempora, o mores! Senatus haec intellegit. Consul videt; hic tamen vivit. Vivit?",
                 "Catilinam orbem terrae caede atque incendiis vastare cupientem nos consules perferemus?"]
  end

  def galeria
    @fotos = ["http://visitosu.oregonstate.edu/sites/visitosu.oregonstate.edu/files/20150417_ettihad_ho3977.jpg",
              "http://www.campusunicaja.es/wp-content/uploads/2015/10/galeria_instalaciones_campus_ronda_05.jpg",
              "https://admissions.ku.edu/sites/default/files/styles/square_400x400_for_circles_/public/2017-03/6036072176_5a6f81575f_o_5.jpg?itok=c4pnctGk",
              "http://footage.framepool.com/shotimg/qf/997764199-universidad-heinrich-heine-de-duesseldorf-profesor-aula-salon.jpg", 
              "http://www.usap.edu/wp-content/uploads/2011/11/usps_campus1.jpg",
              "http://fotos01.diarioinformacion.com/fotos/noticias/318x200/2008-10-22_IMG_2008-10-15_02.20.58__X0402ELCHE.jpg.jpg",
              "https://www.upo.es/upo_opencms/export/sites/upo/Galerias/Imagenes/campus/IMG_5440.JPG"]
  end

  private

    def sesion_iniciada
      return false unless !usuario_actual.nil?
      @usuario = usuario_actual
    end

    def obtener_docentes
      return false unless !@usuario.nil?
      @docentes = []
      @usuario.estudiando.each do |asignatura|
        profesor = Profesor.find(asignatura.profesor.id)
        @docentes << profesor unless @docentes.include? profesor
      end
    end
end
