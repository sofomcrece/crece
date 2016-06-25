class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  # GET /credits
  # GET /credits.json
  def index
    @credits = Credit.all
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

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        format.html { redirect_to @credit, notice: 'Credit was successfully updated.' }
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
      format.html { redirect_to credits_url, notice: 'Credit was successfully destroyed.' }
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
      params.require(:credit).permit(:agente_Empresa, :referencia_AgenteEmpresa, :fecha, :es_Cliente, :como_Se_Entero, :familiar_Con_Prestamo, :nombre_Completo_Familiar_1, :parentesco_1, :nombre_Completo_Familiar_1, :parentesco1, :nombre_Completo_Familiar_1, :parentesco_1, :apellido_Paterno, :apellido_Materno, :nombre_1, :nombre_2, :RFC, :CURP, :seguro, :INE, :nacionalidad, :fecha_De_Nacimiento, :ciudad_De_Nacimiento, :estado_De_Nacimiento, :pais_De_Nacimiento, :sexo, :telefono_De_Casa, :telefono_Celular, :email_1, :email_2, :escolaridad, :actividad_Econimica, :numero_De_Dependientes_Economicos, :gasto_Promedio_Mensual, :estado_Civil, :apellido_Paterno_Del_Conyuge, :apellido_Materno_Del_Conyuge, :nombre_1_Del_Conyuge, :nombre_2_Del_Conyuge, :telefono_Celular_Del_Conyuge, :telefono_De_Oficina_Del_Conyuge, :fecha_De_Nacimiento, :calle, :numero_Interior, :numero_Exterior, :tipo_De_Domicilio, :codigo_Postal, :colonia, :localidad, :municipio, :estado_Actual, :antiguedad_En_El_Domicilio_Actual, :antiguedad_En_El_Domicilio_Anterior, :empresa_Donde_Labora, :giro_De_La_Empresa, :puesto, :telefono_Empresa, :antiguedad_Laboral, :sueldo_Mensual_Neto, :dirreccion_Empresa, :colonia_Empresa, :municipio_Empresa, :monto_Solicitud, :cada_Cuanto_Se_Realizara_El_Pago, :lugar_Donde_Se_Realizara_El_Pago, :nombre_Referencia_1, :domicilio_Referencia_1, :telefono_Fijo_Referencia_1, :telefono_Celular_Referencia_1, :nombre_Referencia_2, :domicilio_Referencia_2, :telefono_Fijo_Referencia_2, :telefono_Celular_Referencia_2, :nombre_Referencia_3, :domicilio_Referencia_3, :telefono_Fijo_Referencia_3, :telefono_Celular_Referencia_3, :nombre_Referencia_Familiar, :domicilio_Referencia_Familiar, :telefono_Fijo_Referencia_Familiar, :telefono_Celular_Referencia_Familiar)
    end
end
