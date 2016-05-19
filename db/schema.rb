# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160515071410) do

  create_table "agents", force: :cascade do |t|
    t.string   "clave"
    t.string   "nombre_del_agente"
    t.string   "apellido_materno"
    t.string   "apellido_paterno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "RFC"
    t.string   "calle"
    t.integer  "numero_interior"
    t.integer  "numero_exterior"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "CURP"
    t.string   "seguro_social"
    t.string   "INE"
    t.string   "nacionalidad"
    t.date     "fecha_de_nacimiento"
    t.string   "ciudad_de_nacimiento"
    t.string   "estado_de_nacimiento"
    t.string   "pais_de_nacimiento"
    t.boolean  "sexo"
    t.string   "telefono_de_casa"
    t.string   "telefono_celular"
    t.string   "correo_electronico_1"
    t.string   "correo_electronico_2"
    t.string   "cuenta_bancaria"
    t.string   "banco"
    t.decimal  "comision_por_cobranza"
    t.decimal  "comision_por_colocacion"
    t.decimal  "monto_maximo_de_prestamo"
    t.boolean  "permitir_prestamo_multiple"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "branch_office_id"
  end

  add_index "agents", ["branch_office_id"], name: "index_agents_on_branch_office_id"

  create_table "branch_offices", force: :cascade do |t|
    t.string   "nombre"
    t.string   "calle"
    t.integer  "no_ext"
    t.integer  "no_int"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "telefono_oficina"
    t.string   "telefono_celular"
    t.string   "correo1"
    t.string   "correo2"
    t.decimal  "comision_por_colocacion"
    t.decimal  "comision_por_cobranza"
    t.decimal  "monto_maximo_adeudo_sucursal"
    t.integer  "formato_impresion"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "branch_offices", ["product_id"], name: "index_branch_offices_on_product_id"
  add_index "branch_offices", ["user_id"], name: "index_branch_offices_on_user_id"

  create_table "companies", force: :cascade do |t|
    t.string   "clave"
    t.string   "nombre_de_empresa"
    t.string   "razon_social"
    t.string   "calle"
    t.integer  "numero_exterior"
    t.integer  "numero_interior"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "telefono_de_oficina"
    t.string   "telefono_celular"
    t.string   "correo_electronico_1"
    t.string   "correo_electronico_2"
    t.string   "cuenta_bacaria"
    t.string   "banco"
    t.decimal  "comicion_por_cobranza"
    t.decimal  "comicion_por_colocacion"
    t.decimal  "monto_maximo_de_prestamo"
    t.boolean  "permitir_prestamo_multiple"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "loans", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true

  create_table "payouts", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "nombre_del_producto"
    t.string   "registro_del_contrado_de_adhesion"
    t.string   "plazo_de_prestamo"
    t.integer  "numero_de_pagos_a_realizar"
    t.decimal  "taza_de_interes_ordinaria"
    t.decimal  "taza_de_interes_moratoria"
    t.decimal  "cat_sin_iva"
    t.decimal  "numero_de_meses_de_sueldo_para_prestamo"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "loan_id"
    t.integer  "payout_id"
  end

  add_index "products", ["loan_id"], name: "index_products_on_loan_id"
  add_index "products", ["payout_id"], name: "index_products_on_payout_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "tipo"
    t.string   "app"
    t.string   "apm"
    t.string   "nom1"
    t.string   "nom2"
    t.string   "RFC"
    t.string   "CURP"
    t.string   "seguro"
    t.string   "INE"
    t.string   "nacionalidad"
    t.datetime "fecha_nacimiento"
    t.string   "nac_ciudad"
    t.string   "nac_estado"
    t.string   "nac_pais"
    t.boolean  "sexo"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "correo1"
    t.string   "correo2"
    t.string   "calle"
    t.integer  "numero_ext"
    t.integer  "numero_int"
    t.string   "colonia"
    t.integer  "codigo_postal"
    t.string   "municipio"
    t.string   "estado"
    t.string   "pais"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
