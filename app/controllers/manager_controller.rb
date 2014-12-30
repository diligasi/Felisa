class ManagerController < ApplicationController
  before_action :go_to_login_if_needed

  WORDS_TO_BE_EXCLUDED = ['pe ', 'irmã ', 'tia ', 'tio ', 'vó ']

  def index
    $couple_history = ContentText.where(:page => 'couple_history').first
    $couple_history = create_if_needed($couple_history, 'couple_history')

    $parents_history = ContentText.where(:page => 'parent_history').first
    $parents_history = create_if_needed($parents_history, 'parent_history')

    $adriano_history = ContentText.where(:page => 'adriano_history').first
    $adriano_history = create_if_needed($adriano_history, 'adriano_history')

    $ana_claudia_history = ContentText.where(:page => 'ana_claudia_history').first
    $ana_claudia_history = create_if_needed($ana_claudia_history, 'ana_claudia_history')

    $carlos_history = ContentText.where(:page => 'carlos_history').first
    $carlos_history = create_if_needed($carlos_history, 'carlos_history')

    $cleiton_history = ContentText.where(:page => 'cleiton_history').first
    $cleiton_history = create_if_needed($cleiton_history, 'cleiton_history')

    $diogo_history = ContentText.where(:page => 'diogo_history').first
    $diogo_history = create_if_needed($diogo_history, 'diogo_history')

    $isabel_history = ContentText.where(:page => 'isabel_history').first
    $isabel_history = create_if_needed($isabel_history, 'isabel_history')

    $isa_edi_history = ContentText.where(:page => 'isa_edi_history').first
    $isa_edi_history = create_if_needed($isa_edi_history, 'isa_edi_history')

    $isis_history = ContentText.where(:page => 'isis_history').first
    $isis_history = create_if_needed($isis_history, 'isis_history')

    $jana_al_history = ContentText.where(:page => 'jana_al_history').first
    $jana_al_history = create_if_needed($jana_al_history, 'jana_al_history')

    $maiara_history = ContentText.where(:page => 'maiara_history').first
    $maiara_history = create_if_needed($maiara_history, 'maiara_history')

    $maria_history = ContentText.where(:page => 'maria_history').first
    $maria_history = create_if_needed($maria_history, 'maria_history')

    $murilo_history = ContentText.where(:page => 'murilo_history').first
    $murilo_history = create_if_needed($murilo_history, 'murilo_history')

    $pe_milton_history = ContentText.where(:page => 'pe_milton_history').first
    $pe_milton_history = create_if_needed($pe_milton_history, 'pe_milton_history')

    $rahira_history = ContentText.where(:page => 'rahira_history').first
    $rahira_history = create_if_needed($rahira_history, 'rahira_history')

    $users_list = AccessUsers.all
  end

  def save_couple_history_content
    ContentText.delete_all(:page => 'couple_history')
    @couple_history = ContentText.new(content_texts_params)
    if @couple_history.save
      redirect_to couple_history_path
    end
  end

  # def save_parents_history_content
  def save_main_people_content
    # ContentText.delete_all(:page => 'parent_history')
    ContentText.delete_all(:page => content_texts_params[:page])
    @new_content = ContentText.new(content_texts_params)
    if @new_content.save
      redirect_to main_people_path
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

    def create_if_needed(obj, page_type)
      if obj.nil?
        obj = ContentText.new
        obj[:page] = page_type
      end
      obj
    end
end
