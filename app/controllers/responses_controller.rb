class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def index
    @responses = Response.all
  end

  def show
  end

  def new
    @response = Response.new
  end

  def edit
  end

  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        ResponseMailer.response_email(params[:response][:full_name], params[:response][:body]).deliver_now
        
        user = User.new(email: params[:response][:email], password: PasswordGenerator.generate, full_name: params[:response][:full_name]).save

        format.html { redirect_to root_path, notice: "Thank you for getting in touch! We will get back to you within 24 hours." }
      else
        format.html { render :new }
      end
    end

  end

  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
    end
  end

  private
    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:full_name, :email, :body)
    end
end
