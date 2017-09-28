class BookAttachmentsController < ApplicationController
  before_action :set_book_attachment, only: [:show, :edit, :update, :destroy]

  # GET /post_attachments
  # GET /scrapbook_attachments.json
  def index
    @book_attachments = BookAttachment.all
  end

  # GET /scrapbook_attachments/1
  # GET /scrapbook_attachments/1.json
  def show
  	@book_attachment = BookAttachment.find_by_id(params[:id])
  end

  # GET /scrapbook_attachments/new
  def new
    @book_attachment = BookAttachment.new
  end

  # GET /scrapbook_attachments/1/edit
  def edit
  end

  # scrapbook /scrapbook_attachments
  # scrapbook /scrapbook_attachments.json
  def create
    @book_attachment = BookAttachment.new(book_attachment_params)

    respond_to do |format|
      if @book_attachment.save
        format.html { redirect_to @book_attachment, notice: 'scrapbook attachment was successfully created.' }
        format.json { render :show, status: :created, location: @book_attachment }
      else
        format.html { render :new }
        format.json { render json: @book_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapbook_attachments/1
  # PATCH/PUT /scrapbook_attachments/1.json
  def update
    respond_to do |format|
      if @book_attachment.update(book_attachment_params)
        format.html { redirect_to @book_attachment.scrapbook, notice: 'scrapbook attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_attachment }
      else
        format.html { render :edit }
        format.json { render json: @book_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapbook_attachments/1
  # DELETE /scrapbook_attachments/1.json
  def destroy
    @book_attachment.destroy
    respond_to do |format|
      format.html { redirect_to @book_attachment.scrapbook, notice: 'scrapbook attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_book_attachment
      @book_attachment = BookAttachment.find(params[:id])
    end


    def book_attachment_params
      params.require(:book_attachment).permit(:scrapbook_id, :image)
    end
end