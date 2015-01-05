class StaticPageController < ApplicationController
  def index
  end

  def gift_list
  end

  def ceremony
  end

  def suppliers
  end

  def couple_history
    @couple_history = ContentText.where("page = 'couple_history'").first
  end

  def testimonials
    @testimonials = Testimonial.all.order('id desc')
    @new_testimonial = Testimonial.new
  end

  def create_testimonial
    @testimonial = Testimonial.new(testimonials_params)
    if @testimonial.save
      redirect_to testimonials_path
    end
  end

  def main_people
    @parents_hist = ContentText.where("page = 'parent_history'").first
    @adriano_hist = ContentText.where("page = 'adriano_history'").first
    @ana_claudia_hist = ContentText.where("page = 'ana_claudia_history'").first
    @carlos_hist = ContentText.where("page = 'carlos_history'").first
    @cleiton_hist = ContentText.where("page = 'cleiton_history'").first
    @diogo_hist = ContentText.where("page = 'diogo_history'").first
    @isabel_hist = ContentText.where("page = 'isabel_history'").first
    @isa_edi_hist = ContentText.where("page = 'isa_edi_history'").first
    @isis_hist = ContentText.where("page = 'isis_history'").first
    @jana_al_hist = ContentText.where("page = 'jana_al_history'").first
    @maiara_hist = ContentText.where("page = 'maiara_history'").first
    @maria_hist = ContentText.where("page = 'maria_history'").first
    @murilo_hist = ContentText.where("page = 'murilo_history'").first
    @pe_milton_hist = ContentText.where("page = 'pe_milton_history'").first
    @rahira_hist = ContentText.where("page = 'rahira_history'").first
    @antonio_hist = ContentText.where("page = 'antonio_history'").first
    @maria_luiza_hist = ContentText.where("page = 'maria_luiza_history'").first
    @sobrinhos_hist = ContentText.where("page = 'sobrinhos_history'").first
    @raquel_hist = ContentText.where("page = 'raquel_history'").first
  end

  private
    def testimonials_params
      params.require(:testimonial).permit(:name, :testimonial)
    end
end
