# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	### Usuarios ###

Usuario.create!(nombre: "sara pedrosa",
								password: "p455w0rd",
								password_confirmation: "p455w0rd",
								email: "vertederonuclear@gmail.com",
								pais: "Pernambuco",
								ciudad: "Madrid",
								matriculado: true,
								residente: true, residencia: "individual",
								#admin: true,
								#imagen: File.open(Rails.root + "public/imagenes/sara/becario.jpg"),
								apuntes: "Las hojas en otoño son mejores.|La vida en si misma no es digna de la muerte.|")

Usuario.create!(nombre: "teresa de jesus",
								password: "p455w0rd",
								password_confirmation: "p455w0rd",
								email: "vinegas.porron@gmail.com",
								pais: "Pernambuco",
								ciudad: "Madrid",
								matriculado: true,
								residente: true, residencia: "compartida",
								#admin: true,
								#imagen: File.open(Rails.root + "public/imagenes/teresa/fondo_prog.jpg"),
								apuntes: "Con esfuerzo y perseverancia podrás alcanzar tus metas.|La cultura se adquiere leyendo libros; pero el conocimiento del mundo, que es mucho más necesario, sólo se alcanza leyendo a los hombres y estudiando las diversas ediciones que de ellos existen.|")

Usuario.create!(nombre: "pedro martínez",
								password: "p455w0rd",
								password_confirmation: "p455w0rd",
								email: "railsprueba@gmail.com",
								pais: "Madagascar",
								ciudad: "Madagascar",
								matriculado: true,
								residente: true, residencia: "compartida",
								#admin: true,
								#imagen: File.open(Rails.root + "public/imagenes/pedro martinez/vaca.jpg"),
								apuntes: "Dime y lo olvido, enséñame y lo recuerdo, involúcrame y lo aprendo.|Los sabios son los que buscan la sabiduría; los necios piensan ya haberla encontrado.|")

Usuario.create!(nombre: "julio mendez",
								password: "p455w0rd",
								password_confirmation: "p455w0rd",
								email: "julio.mendex.garrido@gmail.com",
								pais: "portugal",
								ciudad: "oporto",
								matriculado: true,
								residente: true, residencia: "compartida",
								#admin: true,
								#imagen: File.open(Rails.root + "public/imagenes/teresa/fondo_prog.jpg"),
								apuntes: "Aprender es como remar contra corriente: en cuanto se deja, se retrocede.|Me lo contaron y lo olvidé; lo vi y lo entendí; lo hice y lo aprendí.|")

Usuario.create!(nombre: "tyrion lannister",
								password: "p455w0rd",
								password_confirmation: "p455w0rd",
								email: "expatriado.en.volantis@gmail.com",
								pais: "Poniente",
								ciudad: "cinco lagos",
								matriculado: true,
								residente: true, residencia: "individual",
								#admin: true,
								#imagen: File.open(Rails.root + "public/imagenes/teresa/fondo_prog.jpg"),
								apuntes: "Aprender es como remar contra corriente: en cuanto se deja, se retrocede.|Me lo contaron y lo olvidé; lo vi y lo entendí; lo hice y lo aprendí.|")

20.times do |n|
	nombre = Faker::GameOfThrones.unique.character
	password = "p455w0rd"
	Usuario.create!(nombre: nombre,
									password: password,
									password_confirmation: password,
									matriculado: false)
end

	### Profesores ###
	
imagenes = ["http://freepages.genealogy.rootsweb.ancestry.com/~minascpi/DyerJamesVaughnWeb.jpg", 
						"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Francisxaviermorgan.JPG/220px-Francisxaviermorgan.JPG",
						"https://i1.wp.com/digital.library.adelaide.edu.au/dspace/bitstream/2440/81668/1/Fisher%204.JPG",
						"https://the-artifice.com/wp-content/uploads/2015/07/tumblr_mjyku809RE1qglonbo1_1280-300x393.jpg",
						"http://orig07.deviantart.net/a42e/f/2009/136/a/6/a68045589a0ccf5acde33dc3b229ba86.jpg"]

Profesor.create!( nombre: "dyer james",
								  titulo: "doctor en geografía",
								  sinopsis: "An vero vir amplissumus, P. Scipio, pontifex maximus, Ti. Gracchum mediocriter labefactantem statum rei publicae privatus interfecit; Catilinam orbem terrae caede atque incendiis vastare cupientem nos consules perferemus?" ,
								  biografia:
								  	"Decrevit quondam senatus, ut L. Opimius consul videret, ne quid res publica detrimenti caperet; nox nulla intercessit; interfectus est propter quasdam seditionum suspiciones C. Gracchus, clarissimo patre, avo, maioribus, occisus est cum liberis M. Fulvius consularis. Simili senatus consulto C. Mario et L. Valerio consulibus est permissa res publica; num unum diem postea L. Saturninum tribunum pl. et C. Servilium praetorem mors ac rei publicae poena remorata est? At [vero] nos vicesimum iam diem patimur hebescere aciem horum auctoritatis. Habemus enim huiusce modi senatus consultum, verum inclusum in tabulis tamquam in vagina reconditum, quo ex senatus consulto confestim te interfectum esse, Catilina, convenit. Vivis, et vivis non ad deponendam, sed ad confirmandam audaciam. Cupio, patres conscripti, me esse clementem, cupio in tantis rei publicae periculis me non dissolutum videri, sed iam me ipse inertiae nequitiaeque condemno.
										 Castra sunt in Italia contra populum Romanum in Etruriae faucibus conlocata, crescit in dies singulos hostium numerus; eorum autem castrorum imperatorem ducemque hostium intra moenia atque adeo in senatu videtis intestinam aliquam cotidie perniciem rei publicae molientem. Si te iam, Catilina, comprehendi, si interfici iussero, credo, erit verendum mihi, ne non potius hoc omnes boni serius a me quam quisquam crudelius factum esse dicat. Verum ego hoc, quod iam pridem factum esse oportuit, certa de causa nondum adducor ut faciam. Tum denique interficiere, cum iam nemo tam inprobus, tam perditus, tam tui similis inveniri poterit, qui id non iure factum esse fateatur. [6] Quamdiu quisquam erit, qui te defendere audeat, vives, et vives ita, ut [nunc] vivis, multis meis et firmis praesidiis obsessus, ne commovere te contra rem publicam possis. Multorum te etiam oculi et aures non sentientem, sicut adhuc fecerunt, speculabuntur atque custodient.",
								  imagen: imagenes[0])

Profesor.create!( nombre: "francis morgan",
								  titulo: "doctor catedrático",
								  sinopsis: "Etenim quid est, Catilina, quod iam amplius expectes, si neque nox tenebris obscurare coetus nefarios nec privata domus parietibus continere voces coniurationis tuae potest, si illustrantur, si erumpunt omnia?" ,
								  biografia:
								  	"Meministine me ante diem XII Kalendas Novembris dicere in senatu fore in armis certo die, qui dies futurus esset ante diem VI Kal. Novembris, C. Manlium, audaciae satellitem atque administrum tuae? Num me fefellit, Catilina, non modo res tanta, tam atrox tamque incredibilis, verum, id quod multo magis est admirandum, dies? Dixi ego idem in senatu caedem te optumatium contulisse in ante diem V Kalendas Novembris, tum cum multi principes civitatis Roma non tam sui conservandi quam tuorum consiliorum reprimendorum causa profugerunt. Num infitiari potes te illo ipso die meis praesidiis, mea diligentia circumclusum commovere te contra rem publicam non potuisse, cum tu discessu ceterorum nostra tamen, qui remansissemus, caede te contentum esse dicebas?
										 Quid? cum te Praeneste Kalendis ipsis Novembribus occupaturum nocturno impetu esse confideres, sensistine illam coloniam meo iussu meis praesidiis, custodiis, vigiliis esse munitam? Nihil agis, nihil moliris, nihil cogitas, quod non ego non modo audiam, sed etiam videam planeque sentiam. IV. Recognosce tandem mecum noctem illam superiorem; iam intelleges multo me vigilare acrius ad salutem quam te ad perniciem rei publicae. Dico te priore nocte venisse inter falcarios--non agam obscure--in M. Laecae domum; convenisse eodem complures eiusdem amentiae scelerisque socios. Num negare audes? quid taces? Convincam, si negas. Video enim esse hic in senatu quosdam, qui tecum una fuerunt.",
								  imagen: imagenes[1])

Profesor.create!( nombre: "roderick maulster",
								  titulo: "doctor en alquimia",
								  sinopsis: "O di inmortales! ubinam gentium sumus? in qua urbe vivimus? quam rem publicam habemus?" ,
								  biografia:
								  	"Decrevit quondam senatus, ut L. Opimius consul videret, ne quid res publica detrimenti caperet; nox nulla intercessit; interfectus est propter quasdam seditionum suspiciones C. Gracchus, clarissimo patre, avo, maioribus, occisus est cum liberis M. Fulvius consularis. Simili senatus consulto C. Mario et L. Valerio consulibus est permissa res publica; num unum diem postea L. Saturninum tribunum pl. et C. Servilium praetorem mors ac rei publicae poena remorata est? At [vero] nos vicesimum iam diem patimur hebescere aciem horum auctoritatis. Habemus enim huiusce modi senatus consultum, verum inclusum in tabulis tamquam in vagina reconditum, quo ex senatus consulto confestim te interfectum esse, Catilina, convenit. Vivis, et vivis non ad deponendam, sed ad confirmandam audaciam. Cupio, patres conscripti, me esse clementem, cupio in tantis rei publicae periculis me non dissolutum videri, sed iam me ipse inertiae nequitiaeque condemno.
										 Castra sunt in Italia contra populum Romanum in Etruriae faucibus conlocata, crescit in dies singulos hostium numerus; eorum autem castrorum imperatorem ducemque hostium intra moenia atque adeo in senatu videtis intestinam aliquam cotidie perniciem rei publicae molientem. Si te iam, Catilina, comprehendi, si interfici iussero, credo, erit verendum mihi, ne non potius hoc omnes boni serius a me quam quisquam crudelius factum esse dicat. Verum ego hoc, quod iam pridem factum esse oportuit, certa de causa nondum adducor ut faciam. Tum denique interficiere, cum iam nemo tam inprobus, tam perditus, tam tui similis inveniri poterit, qui id non iure factum esse fateatur. [6] Quamdiu quisquam erit, qui te defendere audeat, vives, et vives ita, ut [nunc] vivis, multis meis et firmis praesidiis obsessus, ne commovere te contra rem publicam possis. Multorum te etiam oculi et aures non sentientem, sicut adhuc fecerunt, speculabuntur atque custodient.",
								  imagen: imagenes[2])

Profesor.create!( nombre: "don simio",
								  titulo: "biologo academico",
								  sinopsis: "Hic, hic sunt in nostro numero, patres conscripti, in hoc orbis terrae sanctissimo gravissimoque consilio, qui de nostro omnium interitu, qui de huius urbis atque adeo de orbis terrarum exitio cogitent!" ,
								  biografia:
								  	"Fuisti igitur apud Laecam illa nocte, Catilina, distribuisti partes Italiae, statuisti, quo quemque proficisci placeret, delegisti, quos Romae relinqueres, quos tecum educeres, discripsisti urbis partes ad incendia, confirmasti te ipsum iam esse exiturum, dixisti paulum tibi esse etiam nunc morae, quod ego viverem. Reperti sunt duo equites Romani, qui te ista cura liberarent et sese illa ipsa nocte paulo ante lucem me in meo lectulo interfecturos [esse] pollicerentur. [10] Haec ego omnia vixdum etiam coetu vestro dimisso comperi; domum meam maioribus praesidiis munivi atque firmavi, exclusi eos, quos tu ad me salutatum mane miseras, cum illi ipsi venissent, quos ego iam multis ac summis viris ad me id temporis venturos esse praedixeram.
										 Quae cum ita sint, Catilina, perge, quo coepisti, egredere aliquando ex urbe; patent portae; proficiscere. Nimium diu te imperatorem tua illa Manliana castra desiderant. Educ tecum etiam omnes tuos, si minus, quam plurimos; purga urbem. Magno me metu liberabis, dum modo inter me atque te murus intersit. Nobiscum versari iam diutius non potes; non feram, non patiar, non sinam.",
								  imagen: imagenes[3])

Profesor.create!( nombre: "thomas roble",
								  titulo: "cientificista jefe",
								  sinopsis: "In qua nemo est extra istam coniurationem perditorum hominum, qui te non metuat, nemo, qui non oderit. " ,
								  biografia:
								  	"Quae nota domesticae turpitudinis non inusta vitae tuae est? quod privatarum rerum dedecus non haeret in fama? quae lubido ab oculis, quod facinus a manibus umquam tuis, quod flagitium a toto corpore afuit? cui tu adulescentulo, quem corruptelarum inlecebris inretisses, non aut ad audaciam ferrum aut ad lubidinem facem praetulisti? [14] Quid vero? nuper cum morte superioris uxoris novis nuptiis domum vacuefecisses, nonne etiam alio incredibili scelere hoc scelus cumulasti? quod ego praetermitto et facile patior sileri, ne in hac civitate tanti facinoris inmanitas aut extitisse aut non vindicata esse videatur. Praetermitto ruinas fortunarum tuarum, quas omnis inpendere tibi proxumis Idibus senties; ad illa venio, quae non ad privatam ignominiam vitiorum tuorum, non ad domesticam tuam difficultatem ac turpitudinem sed ad summam rem publicam atque ad omnium nostrum vitam salutemque pertinent. [15] Potestne tibi haec lux, Catilina, aut huius caeli spiritus esse iucundus, cum scias esse horum neminem, qui nesciat te pridie Kalendas Ianuarias Lepido et Tullo consulibus stetisse in comitio cum telo, manum consulum et principum civitatis interficiendorum causa paravisse, sceleri ac furori tuo non mentem aliquam aut timorem tuum sed fortunam populi Romani obstitisse?
										 Ac iam illa omitto--neque enim sunt aut obscura aut non multa commissa postea--quotiens tu me designatum, quotiens consulem interficere conatus es! quot ego tuas petitiones ita coniectas, ut vitari posse non viderentur, parva quadam declinatione et, ut aiunt, corpore effugi! nihil [agis, nihil] adsequeris [, nihil moliris] neque tamen conari ac velle desistis. [16] Quotiens tibi iam extorta est ista sica de manibus, quotiens [vero] excidit casu aliquo et elapsa est! [tamen ea carere diutius non potes] quae quidem quibus abs te initiata sacris ac devota sit, nescio, quod eam necesse putas esse in consulis corpore defigere.",
								  imagen: imagenes[4])

# 5.times do |n|
# 	nombre = Faker::FamilyGuy.character
# 	titulo = Faker::Job.title
# 	sinopsis = Faker::ChuckNorris.fact
# 	imagen = imagenes[n - 1]
# 	Profesor.create!( nombre: nombre,
# 									  titulo: titulo,
# 									  sinopsis: sinopsis,
# 									  biografia:
# 									  imagen: imagen)
# end

	### Asignaturas ###


def crear_preguntas
	examen = []
	10.times do |n|
		examen << (n.odd? ? Faker::HitchhikersGuideToTheGalaxy.marvin_quote :	Faker::ChuckNorris.fact)
	end
	examen.join(' ')
end

modalidad = ["Presencial", "A distancia", "Formativa", "Oyente"]
edificios = ['Anexo principal', 'Facultad de comunicación', 'Araña 1', 
						 'Araña 2', 'Edificio Naranja', 'Facultad Ecologia Humana', 
						 'Pirámides', 'Piscina', 'Sala de Teatro', 'Anexo Norte', 'Taller de diseño']
preguntas = crear_preguntas
respuestas = "true; false; true; false; true; false; true; false; true; false"

Asignatura.create!(	nombre: "ciencias sociales",
										codigo: 234,
										duracion: "245 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 1,
										edificio: edificios[rand(10)],
										bibliografia: ["Aguirre Baztán, Á. (Ed.). (1995). Etnografía: Metodología cualitativa en la investigación sociocultural. Barcelona: Boixareu Universitaria.",
										 							 "Aguirre, Á. (Ed.). (1997). Cultura e identidad cultural: Introducción a la antropología. Barcelona : Bardenas.",
										 							 "Appadurai, A. (2008). Modernity at large: Cultural dimensions of globalization (8th pr.). Minneapolis: University of Minnesota Press."], 
										descripcion: 
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?" ,
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "aleman I",
										codigo: 24,
										duracion: "340 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 1,
										edificio: edificios[rand(10)],
										bibliografia: ["Abegg, Birgit. Langenscheidts Handbuch der Wirtschaftssprache. Spanisch / Von Birgit Abegg und Julián E. Moreno . 5. Auflage Berlin ; München ; Leipzig ; Wien ; Zürich ; New York : Langenscheidt, 1997",
									 								 "Daum, Ulrich. Wörterbuch Recht : Spanisch-Deutsch, Deutsch-Spanisch / von Ulrich Daum, Celestino Sánchez López, Herbert J. Becher = Diccionario : Español-Alemán, Alemán-Español / de Ulrich Daum, Celestino Sánchez López, Herbert J. Becher . München : Beck, cop. 2005",
																	 "Eichborn, Reinhart von. Wirtschaftsspanisch = [Diccionario Económico- Empresarial. 2, Spanisch-Deutsch = [Español-Alemán] / Isabelle von Eichborn ; traducción a la lengua española, Mario Puime-Heuler] . Burscheid : Lexiport, [1990?]"] ,
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "procedimientos mitocondriales",
										codigo: 767,
										duracion: "840 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 2,
										edificio: edificios[rand(10)],
										bibliografia: ["Augé, M. (1996). El sentido de los otros: Actualidad de la antropología. Barcelona: Paidós.",
																	 "Augé, M. (1998). Hacia una antropología de los mundos contemporáneos (2ª ed.). Barcelona: Gedisa."],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "sonidos de la espesura",
										codigo: 212,
										duracion: "560 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 2,
										edificio: edificios[rand(10)],
										bibliografia: ["García Canclini, N. (2004). Diferentes, desiguales, desconectados: Mapas de la interculturalidad. Barcelona: Gedisa.",
																	 "García, J.L. y Barañano, A. (2003). Culturas en contacto: Encuentros y desencuentros. Madrid: MEC.",
																	 "Gerrtz, C. (1989). El antropólogo como autor. Barcelona: Paidós."],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "costumbres noctambulas",
										codigo: 112,
										duracion: "240 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 3,
										edificio: edificios[rand(10)],
										bibliografia: ["Levi-Strauss, C. (1988). Tristes trópicos. Barcelona: Paidós.",
																	 "Lisón Tolosana, C. (1997). Las máscaras de la identidad: Claves antropológicas. Barcelona: Ariel.",
																	 "Lisón Tolosana, C. (Ed.). (2007). Introducción a la antropología social y cultural: Teoría, método y práctica. Madrid: Akal."],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "dimensiones alternativas",
										codigo: 666,
										duracion: "450 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 3,
										edificio: edificios[rand(10)],
										bibliografia: ["Rabinow, P. (1992). Reflexiones sobre un trabajo de campo en Marruecos. Madrid: Jucar.",
																	 "Ramírez Goicoechea, E. (2007). Etnicidad, identidad y migraciones: Teorías, conceptos y experiencias. Madrid: Editorial Universitaria Ramón Areces.",
																	 "Reynoso, C. (1998). Corrientes en antropología contemporánea. Buenos Aires: Biblos."],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "Ciencias naturales",
										codigo: 600,
										duracion: "600 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 4,
										edificio: edificios[rand(10)],
										bibliografia: ["Warnier, J.P. (2002). La mundialización de la cultura. Barcelona: Gedisa.",
																	 "Wihtol de Wenden, C. (2000). ¿Hay que abrir las fronteras?. Barcelona: Bellaterra."],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "Retorica monetaria",
										codigo: 130,
										duracion: "560 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 4,
										edificio: edificios[rand(10)],
										bibliografia: ["Castañer Balcells, Marta. Globalidad e interdisciplina curricular en la enseñanza primaria : propuestas teórico-prácticas / Marta Castañer Balcells, Eugenia Trigo Aza . 1a. ed. Zaragoza : Inde, 1995",
																	 "Casterad Seral, Jaime. Actividades en la naturaleza / Roberto Guillén, Susana Lapetra, y Jaime Casterad . 1a. ed. Barcelona : Inde, 2000",
																	 "Guillén Correas, Roberto ;Santos Pastor, Marisa . El medio natural como eje pedagógico. Una visión integrada . En Didáctica de la educación física. Madrid : Biblioteca Nueva, 2004"],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "inspecciones reticulares",
										codigo: 12,
										duracion: "300 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 5,
										edificio: edificios[rand(10)],
										bibliografia: ["Long, John. Escalar en rocódromos / John Long ; traducción, Isabel Galera . 1a. ed. en castellano Madrid : Desnivel, D.L. 1995",
																	 "BC 	Luebben, Craig. Nudos para escaladores / Craig Luebben ; ilustraciones por Steven Dieckhoff . 2a. ed. en castellano [Madrid] : Desnivel, D.L. 1995",
																	 "Lujan, J. Ignacio. Maniobras básicas de cuerda. Madrid : Desnivel, 1995 "],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

Asignatura.create!(	nombre: "proyectos finales",
										codigo: 420,
										duracion: "610 Horas",
										modalidad: modalidad[rand(4) + 1],
										profesor_id: 5,
										edificio: edificios[rand(10)],
										bibliografia: ["Albesa, Carlos. Bases para el entrenamiento de la escalada / Carlos Albesa, Pere Lloveras ; fotografías, Gloria Solsona. . 1a. ed. Madrid : Desnivel, 1999",
																	 "Arocena, P.. Escalada deportiva y entrenamiento. Madrid : Desnivel 1997"],
										descripcion:  
											"Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? 
											 Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris? 
											 O tempora, o mores! 
											 Senatus haec intellegit. 
											 Consul videt; hic tamen vivit. 
											 Vivit? immo vero etiam in senatum venit, fit publici consilii particeps, notat et designat oculis ad caedem unum quemque nostrum. 
											 Nos autem fortes viri satis facere rei publicae videmur, si istius furorem ac tela vitemus. 
											 Ad mortem te, Catilina, duci iussu consulis iam pridem oportebat, in te conferri pestem, quam tu in nos [omnes iam diu] machinaris.",
										temario: "Quo usque tandem abutere, Catilina, patientia nostra? 
											 				Quam diu etiam furor iste tuus nos eludet? 
											 				Quem ad finem sese effrenata iactabit audacia?",
										examen: crear_preguntas,
										respuestas: respuestas )

# 10.times do |n|
# 	nombre = Faker::Educator.course
# 	codigo = rand(100) + 1
# 	duracion = (((rand(10) + 1) * 10) + 500).to_s + " horas"
# 	modal = modalidad[rand(4) + 1]
# 	docente = rand(5) + 1
# 	edificio = edificios[rand(10)]
# 	bibliografia = Faker::Lovecraft.paragraph(1,3)
# 	descripcion = Faker::Lovecraft.paragraph(8)
# 	temario = Faker::Lovecraft.paragraph(5, 3)
# 	preguntas = crear_preguntas
# 	respuestas = "true; false; true; false; true; false; true; false; true; false"

# 	Asignatura.create!(	nombre: nombre,
# 											codigo: codigo,
# 											duracion: duracion,
# 											profesor_id: docente,
# 											edificio: edificio,
# 											bibliografia: bibliografia,
# 											descripcion: descripcion,
# 											temario: temario,
# 											examen: preguntas,
# 											respuestas: respuestas )
# end

	### Usuarios matriculados - Inscripciones ###

def enrolar(numero)
	banda = []
	numero.times do
		asignatura = (rand(10) + 1).to_s
		banda << asignatura unless banda.include? asignatura
	end
	return banda
end

alumnos = Usuario.all
alumnos.each do |alumno|
	matricula = enrolar(rand(10) + 1)
	matricula.each do |asig|
		alumno.inscribirse(Asignatura.find(asig))
	end
end


