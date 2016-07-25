class PagesController < ApplicationController
  # Método que valida que la página exista. Si no es así, despliega la página 404 de error.
  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  # Método privado que valida si la página existe.
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.slim"))
  end
end
