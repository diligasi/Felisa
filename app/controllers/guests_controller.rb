class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :go_to_login_if_needed, except: [:confirm, :guest_autocomplete_list, :select_guest, :confirm_this_guest]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guests.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guests.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guests.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guests was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guests was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guests was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
  end

  def guest_autocomplete_list
    render :text => '' and return if params[:data].blank?
    # data = Guests.select('distinct name').where("upper(name) like '#{params[:data].upcase}%'").limit(10).all
    @guests = Guests.where("upper(name) like '%#{params[:data].upcase}%'").order('name').all
    str = ''
    # Array.wrap(data).each do |option|
    Array.wrap(@guests).each do |option|
      str += "#{option['name']}|"
    end
    str += ''
    render :text => str
  end

  def select_guest
    guest_name = removeRepetition(params[:data].gsub(/[^a-zA-Z\d\s:]/, '%'))
    @guest_to_confirm = Guests.where("upper(name) like '%#{guest_name.upcase}%'").first

    render :json => @guest_to_confirm
  end

  def confirm_this_guest
    guest = Guests.find(params[:data])
    if guest.is_confirmed
      render :text => 'Sua presença já foi confirmada!'
    else
      guest.is_confirmed = true
      guest.save
      render :text => 'Salvo'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guests.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guests).permit(:name, :accompanying_number)
    end

    def go_to_login_if_needed
      redirect_to login_path unless logged_in?
    end

    def removeRepetition(arr)
      result = ''
      for i in 0...arr.size
        next if i != 0 && arr[i] == arr[i - 1]
        result += arr[i]
      end
      return result
    end
end
