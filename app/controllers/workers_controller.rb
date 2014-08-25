#encoding: UTF-8
class WorkersController < ApplicationController
  #skip_before_filter :authenticate_admin! , [:show, :index] 
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  #before_filter :admin_user, only: [:edit, :update, :create, :new, :destroy]
   before_filter :authenticate_admin! , :except => [:show, :index]
  

  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all.sort{|x,y| x.average_rate <=> y.average_rate}.reverse
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
    @reviews = @worker.reviews.paginate(page: params[:page])
  end

  # GET /workers/new
  def new
    @worker = Worker.new
    @worker.reviews.build
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        
        format.html { redirect_to @worker, notice: 'تمت العملية بنجاح' }
        format.json { render :show, status: :created, location: @worker }
      else
        @worker.reviews.build if @worker.reviews.empty?
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'تمت العملية بنجاح' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'تمت العملية بنجاح' }
      format.json { head :no_content }
    end
  end



  def comment
    @worker = Worker.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:name, :phone, :area, :status, :job_id, :reviews_attributes => [:price, :clean, :quilty, :disicpline, :treatment, :comment])
    end

    # def admin_user
    #     redirect_to root_path unless admin_signed_in?
    # end


end