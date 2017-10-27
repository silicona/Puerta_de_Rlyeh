# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171017111817) do

  create_table "asignaturas", force: :cascade do |t|
    t.string "nombre"
    t.integer "codigo"
    t.string "duracion"
    t.string "modalidad"
    t.string "edificio"
    t.text "bibliografia"
    t.text "descripcion"
    t.text "temario"
    t.integer "profesor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "examen"
    t.string "respuestas"
    t.index ["codigo"], name: "index_asignaturas_on_codigo"
    t.index ["profesor_id"], name: "index_asignaturas_on_profesor_id"
  end

  create_table "inscripciones", force: :cascade do |t|
    t.integer "alumno_id"
    t.integer "aula_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nota"
    t.index ["alumno_id", "aula_id"], name: "index_inscripciones_on_alumno_id_and_aula_id", unique: true
    t.index ["alumno_id"], name: "index_inscripciones_on_alumno_id"
    t.index ["aula_id"], name: "index_inscripciones_on_aula_id"
  end

  create_table "profesores", force: :cascade do |t|
    t.string "nombre"
    t.string "titulo"
    t.string "departamento"
    t.string "imagen"
    t.text "sinopsis"
    t.text "biografia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "ciudad"
    t.string "pais"
    t.text "apuntes"
    t.string "imagen", default: "avatar_prueba.jpg"
    t.boolean "matriculado", default: false
    t.boolean "residente", default: false
    t.boolean "admin", default: false
    t.string "digest_activacion"
    t.string "digest_recuerda"
    t.string "digest_reseteo"
    t.string "residencia"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["nombre"], name: "index_usuarios_on_nombre", unique: true
  end

end
