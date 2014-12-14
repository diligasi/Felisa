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

  private
    def testimonials_params
      params.require(:testimonial).permit(:name, :testimonial)
    end
end
