class CreditsController < ApplicationController
  layout "layouts/credito"
  before_action :set_credit, only: [:show, :edit, :update, :destroy,:aprobar,:pdf,:text]

  # GET /credits
  # GET /credits.json
  def pdf
    send_data Base64.decode64(@credit.pdf64[28..@credit.pdf64.length]), :type => 'application/pdf', :filename => "documentos.pdf", :disposition => "inline"
  end
  def text
    render text:@credit.pdf64
  end
  def index
    @credits = Credit.all.where(status:1)
    nom1 = params[:nombre1]
    nom2 = params[:nombre2]
    pat = params[:paterno]
    mat = params[:materno]
    curp = params[:curp]
    suc = params[:sucursal]
    tipo_padre = params[:tpadre]
    padre_id = params[:padre]
    product_id = params[:product_id]
    
     @credits =@credits.where("lower(CURP) = '#{curp.downcase}'") unless  params[:curp].nil? or  params[:curp]==""
     @credits =@credits.where("lower(nombre_1) like '#{nom1.downcase}%'") unless  params[:nombre1].nil? or  params[:nombre1]==""
     @credits =@credits.where("lower(nombre_2) like '#{nom2.downcase}%'") unless  params[:nombre2].nil? or  params[:nombre2]==""
     @credits =@credits.where("lower(apellido_paterno) like '#{pat.downcase}%'") unless  params[:paterno].nil? or  params[:paterno]==""
     @credits =@credits.where("lower(apellido_materno) like '#{mat.downcase}%'") unless  params[:materno].nil? or  params[:materno]==""
     
     @credits =@credits.where("agente_empresa = ? and referencia_agente_empresa = ? ",tipo_padre,padre_id) unless  params[:tpadre].nil? or  params[:tpadre]=="" or  params[:padre].nil? or  params[:padre]==""
     @credits =@credits.where("agente_empresa = ? and referencia_agente_empresa = ? ",tpadre,padre)  unless  params[:product_id].nil? or  params[:product_id]==""
     
     
     
     
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(credit_params)
    create_customer
    respond_to do |format|
      if @credit.save
        format.html { redirect_to @credit, notice: 'Credit was successfully created.' }
        format.json { render :show, status: :created, location: @credit }
      else
        format.html { render :new }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end
  def aprobar
     @credit.update(status:1)
  end
  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        create_customer
        format.html { redirect_to "/view_credits", notice: 'Credit was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit }
      else
        format.html { render :edit }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit.destroy
    respond_to do |format|
      format.html { redirect_to /view_credits/, notice: 'Credit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:pdf64,:profecion_id,:ocupacion_del_conyuge , :empresa_donde_labora_el_conyuge, :ocupation_id,:destination_id,:casa_color,:cancel_o_porton,:color_de_cancel,:caracteristicas_especiales,:numero_de_cheque ,:antiguedad_laboral_anos,:antiguedad_laboral_meses,:product_id,:nombre_completo_4,:edad_4,:parentesco_del_dependiente_4,:antiguedad_en_el_domicilio_anterior_anos,:antiguedad_en_el_domicilio_anterior_meses, :observaciones,  :nombre_completo_familiar_3, :parentesco_3, :nombre_completo_familiar_4, :parentesco_4,:agente_empresa,:referencia_agente_empresa,:fecha,  :es_cliente, :como_se_entero,  :familiar_con_prestamo, :nombre_completo_familiar_1, :parentesco_1, :apellido_paterno,  :apellido_materno, :nombre_1,  :nombre_2, :RFC,:CURP,:seguro,:INE,  :nacionalidad, :fecha_de_nacimiento,:ciudad_de_nacimiento,:estado_de_nacimiento,:sexo,:telefono_de_casa,:telefono_celular,:email_1,  :email_2, :escolaridad,:numero_de_dependientes_economicos,  :gasto_promedio_mensual, :estado_civil,  :apellido_paterno_del_conyuge, :apellido_materno_del_conyuge,  :nombre_1_del_conyuge, :nombre_2_del_conyuge,  :telefono_celular_del_conyuge, :telefono_de_oficina_del_conyuge,:calle,  :numero_interior, :numero_exterior, :tipo_de_domicilio,:codigo_postal,  :colonia, :municipio,:antiguedad_en_el_domicilio_actual_meses,:antiguedad_en_el_domicilio_actual_anos,  :antiguedad_en_el_domicilio_anterior, :empresa_donde_labora, :giro_de_la_empresa, :puesto, :telefono_empresa, :sueldo_mensual_neto, :dirreccion_empresa,  :colonia_empresa, :municipio_empresa, :monto_solicitud,:cada_cuanto_se_realizara_el_pago,:lugar_donde_se_realizara_el_pago,:nombre_referencia_1,  :domicilio_referencia_1, :telefono_fijo_referencia_1,  :telefono_celular_referencia_1, :nombre_referencia_2, :domicilio_referencia_2,  :telefono_fijo_referencia_2, :telefono_celular_referencia_2, :nombre_referencia_familiar, :domicilio_referencia_familiar, :telefono_fijo_referencia_familiar,:telefono_celular_referencia_familiar,:nombre_completo_familiar_2,:parentesco_2,:nombre_completo_1,  :edad_1, :parentesco_del_dependiente_1,  :nombre_completo_2, :edad_2, :parentesco_del_dependiente_2, :nombre_completo_3, :edad_3,  :parentesco_del_dependiente_3, :status,  :economical_activity_id,:country ,:estado_actual,:localidad,:fecha_de_nacimiento_conyuge)
    end
    def create_customer
       customer=Customer.find_by(CURP:@credit.CURP)
        if customer.nil?
          customer=Customer.create(credit_params.except(:pdf64,:destination_id,:casa_color,:cancel_o_porton,:color_de_cancel,:caracteristicas_especiales,:antiguedad_laboral_meses,:antiguedad_laboral_anos,:product_id,:antiguedad_en_el_domicilio_anterior_anos,:antiguedad_en_el_domicilio_anterior_meses,:antiguedad_en_el_domicilio_actual_meses,:antiguedad_en_el_domicilio_actual_anos,:fecha,:es_cliente,:monto_solicitud,:cada_cuanto_se_realizara_el_pago,:lugar_donde_se_realizara_el_pago))
        end
        @credit.customer_id=customer.id
    end
end


    