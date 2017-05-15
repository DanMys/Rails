class DocsController < ApplicationController
  #Ejecuta la accion antes que cualquier cosa, y solo puede ser utilizada
  #por los metodos especificados
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.all.order("created_at DESC")
  end

  def show
  end

  def new
    @doc = Doc.new
  end

  # No tiene vista propia
  def create
    @doc = Doc.new(doc_params)

    # Si el documento se guarda, redirgir al documento, si no
    # mandar de nuevo al metodo new, para tratar de nuevo
    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end

  #Responsable de la vista
  def edit
  end

  # No tiene vista propia
  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

    def find_doc
      @doc = Doc.find(params[:id])
    end

    #title y content son los parametros requeridos
    def doc_params
      params.require(:doc).permit(:title, :content)
    end
end
