class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    nom = params[:nombre]
    pat = params[:paterno]
    mat = params[:materno]
     @customers =@customers.where("lower(nombre_1) like '#{nom.downcase}%'") unless  params[:nombre].nil? or  params[:nombre]==""
     @customers =@customers.where("lower(apellido_paterno) like '#{pat.downcase}%'") unless  params[:paterno].nil? or  params[:paterno]==""
     @customers =@customers.where("lower(apellido_materno) like '#{mat.downcase}%'") unless  params[:materno].nil? or  params[:materno]==""
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:fecha_de_nacimiento_conyuge, :agente_empresa, :referencia_agenteEmpresa, :como_se_entero, :familiar_con_prestamo, :nombre_completo_familiar_1, :parentesco_1, :apellido_paterno, :apellido_materno, :nombre_1, :nombre_2, :RFC, :CURP, :seguro, :INE, :nacionalidad, :fecha_de_nacimiento, :ciudad_de_nacimiento, :estado_de_nacimiento, :sexo, :telefono_de_casa, :telefono_celular, :email_1, :email_2, :escolaridad, :numero_de_dependientes_economicos, :gasto_promedio_mensual, :estado_civil, :apellido_paterno_del_conyuge, :apellido_materno_del_conyuge, :nombre_1_del_conyuge, :nombre_2_del_conyuge, :telefono_celular_del_conyuge, :telefono_de_oficina_del_conyuge, :calle, :numero_interior, :numero_exterior, :tipo_de_domicilio, :codigo_postal, :colonia, :municipio, :antiguedad_en_el_domicilio_actual, :antiguedad_en_el_domicilio_anterior, :empresa_donde_labora, :giro_de_la_empresa, :puesto, :telefono_empresa, :antiguedad_laboral, :sueldo_mensual_neto, :dirreccion_empresa, :colonia_empresa, :municipio_empresa, :nombre_referencia_1, :domicilio_referencia_1, :telefono_fijo_referencia_1, :telefono_celular_referencia_1, :nombre_referencia_2, :domicilio_referencia_2, :telefono_fijo_referencia_2, :telefono_celular_referencia_2, :nombre_referencia_familiar, :domicilio_referencia_familiar, :telefono_fijo_referencia_familiar, :telefono_celular_referencia_familiar, :nombre_completo_familiar_2, :parentesco_2, :nombre_completo_1, :edad_1, :parentesco_del_dependiente_1, :nombre_completo_2, :edad_2, :parentesco_del_dependiente_2, :nombre_completo_3, :edad_3, :parentesco_del_dependiente_3, :status, :economical_activity_id, :nombre_completo_familiar_3, :parentesco_3, :nombre_completo_familiar_4, :parentesco_4, :nombre_completo_4, :edad_4, :parentesco_del_dependiente_4, :estado_actual, :localidad, :observaciones, :country_id)
    end
end
