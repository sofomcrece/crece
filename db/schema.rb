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

ActiveRecord::Schema.define(version: 20160709210355) do

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
    t.string   "clave"
  end

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
    t.integer  "branch_office_id"
  end

  add_index "companies", ["branch_office_id"], name: "index_companies_on_branch_office_id"

  create_table "countries", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credits", force: :cascade do |t|
    t.boolean  "agente_Empresa"
    t.integer  "referencia_AgenteEmpresa"
    t.date     "fecha"
    t.boolean  "es_Cliente"
    t.text     "como_Se_Entero"
    t.boolean  "familiar_Con_Prestamo"
    t.string   "nombre_Completo_Familiar_1"
    t.string   "parentesco_1"
    t.string   "parentesco1"
    t.string   "apellido_Paterno"
    t.string   "apellido_Materno"
    t.string   "nombre_1"
    t.string   "nombre_2"
    t.string   "RFC"
    t.string   "CURP"
    t.string   "seguro"
    t.string   "INE"
    t.string   "nacionalidad"
    t.date     "fecha_De_Nacimiento"
    t.string   "ciudad_De_Nacimiento"
    t.string   "estado_De_Nacimiento"
    t.boolean  "sexo"
    t.string   "telefono_De_Casa"
    t.string   "telefono_Celular"
    t.string   "email_1"
    t.string   "email_2"
    t.integer  "escolaridad"
    t.integer  "numero_De_Dependientes_Economicos"
    t.decimal  "gasto_Promedio_Mensual"
    t.integer  "estado_Civil"
    t.string   "apellido_Paterno_Del_Conyuge"
    t.string   "apellido_Materno_Del_Conyuge"
    t.string   "nombre_1_Del_Conyuge"
    t.string   "nombre_2_Del_Conyuge"
    t.string   "telefono_Celular_Del_Conyuge"
    t.string   "telefono_De_Oficina_Del_Conyuge"
    t.string   "calle"
    t.integer  "numero_Interior"
    t.integer  "numero_Exterior"
    t.integer  "tipo_De_Domicilio"
    t.integer  "codigo_Postal"
    t.string   "colonia"
    t.string   "municipio"
    t.string   "antiguedad_En_El_Domicilio_Actual"
    t.string   "antiguedad_En_El_Domicilio_Anterior"
    t.string   "empresa_Donde_Labora"
    t.string   "giro_De_La_Empresa"
    t.string   "puesto"
    t.string   "telefono_Empresa"
    t.string   "antiguedad_Laboral"
    t.string   "sueldo_Mensual_Neto"
    t.string   "dirreccion_Empresa"
    t.string   "colonia_Empresa"
    t.string   "municipio_Empresa"
    t.decimal  "monto_Solicitud"
    t.integer  "cada_Cuanto_Se_Realizara_El_Pago"
    t.integer  "lugar_Donde_Se_Realizara_El_Pago"
    t.string   "nombre_Referencia_1"
    t.string   "domicilio_Referencia_1"
    t.string   "telefono_Fijo_Referencia_1"
    t.string   "telefono_Celular_Referencia_1"
    t.string   "nombre_Referencia_2"
    t.string   "domicilio_Referencia_2"
    t.string   "telefono_Fijo_Referencia_2"
    t.string   "telefono_Celular_Referencia_2"
    t.string   "nombre_Referencia_3"
    t.string   "domicilio_Referencia_3"
    t.string   "telefono_Fijo_Referencia_3"
    t.string   "telefono_Celular_Referencia_3"
    t.string   "nombre_Referencia_Familiar"
    t.string   "domicilio_Referencia_Familiar"
    t.string   "telefono_Fijo_Referencia_Familiar"
    t.string   "telefono_Celular_Referencia_Familiar"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "nombre_Completo_Familiar_2"
    t.string   "parentesco_2"
    t.string   "nombre_completo_1"
    t.integer  "edad_1"
    t.string   "parentesco_del_dependiente_1"
    t.string   "nombre_completo_2"
    t.integer  "edad_2"
    t.string   "parentesco_del_dependiente_2"
    t.string   "nombre_completo_3"
    t.integer  "edad_3"
    t.string   "parentesco_del_dependiente_3"
    t.integer  "status"
    t.integer  "economical_activity_id"
    t.integer  "localidad_cnbv_id"
    t.integer  "state_id"
    t.integer  "country_id"
  end

  add_index "credits", ["country_id"], name: "index_credits_on_country_id"
  add_index "credits", ["economical_activity_id"], name: "index_credits_on_economical_activity_id"
  add_index "credits", ["localidad_cnbv_id"], name: "index_credits_on_localidad_cnbv_id"
  add_index "credits", ["state_id"], name: "index_credits_on_state_id"

  create_table "economical_activities", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "loans", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "localidad_cnbvs", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.string   "entidad_federativa"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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

  create_table "ocupations", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.integer  "forma_de_pago_interes"
    t.integer  "plazo_de_prestamo_interes"
    t.integer  "numero_de_pagos_a_realizar_interes"
  end

  add_index "products", ["loan_id"], name: "index_products_on_loan_id"
  add_index "products", ["payout_id"], name: "index_products_on_payout_id"

  create_table "profecions", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.integer  "clave"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.string   "alias"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
