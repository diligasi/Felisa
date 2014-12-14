class ManagerController < ApplicationController
  before_action :go_to_login_if_needed

  WORDS_TO_BE_EXCLUDED = ['pe ', 'irmã ', 'tia ', 'tio ', 'vó ']

  def index
    $couple_history = ContentText.where(:page => 'couple_history').first
    if $couple_history.nil?
      $couple_history = ContentText.new
      $couple_history['page'] = 'couple_history'
    end
  end

  def save_couple_history_content
    ContentText.delete_all(:page => 'couple_history')
    @couple_history = ContentText.new(content_texts_params)
    if @couple_history.save
      redirect_to couple_history_path
    end
  end

  def guests
    saved_file = uploadFile(params[:upload])
    doc = SimpleXlsxReader.open saved_file
    worksheet = doc.sheets[0]
    Guests.delete_all
    ActiveRecord::Base.transaction do
      worksheet.rows.each_with_index do |line_val, idx|
        break if line_val.all? { |x| x == nil }
        next if idx == 0  
        new_guest = Guests.new
        new_guest.name = normalize_name(line_val[0])
        new_guest.accompanying_number = line_val[2]
        new_guest.save
      end
    end
    redirect_to guests_index_path
  end

  private
    def go_to_login_if_needed
      redirect_to login_path unless logged_in?
    end

    def content_texts_params
      params.require(:content_text).permit(:page, :title, :page_text)
    end

    def uploadFile(upload)
      name =  upload['datafile'].original_filename
      directory = 'public/uploaded/temp'
      # delete all files or directoris from temp folder
      delete_existing_files(directory)
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, 'wb') { |f| f.write(upload['datafile'].read) }

      path
    end

    def delete_existing_files(dir_path)
      Pathname.new(dir_path).children.each { |p| p.unlink }
    end

    def normalize_name(name)
      aux = nil
      normalized_name = ''
      name = name.gsub(',', ' e ')

      WORDS_TO_BE_EXCLUDED.each do |word|
        unless name.downcase.index(word).nil?
          aux = name.downcase.gsub(word, '').split(' ')
        end
      end

      aux = name.split(' ') if aux.blank?
      aux.each { |n| normalized_name += n.size > 2 ? n.capitalize + ' ' : n + ' ' }

      return normalized_name[0...-1]
    end
end
