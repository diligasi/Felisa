desc "Renomeia arquivos de um determinado diretório."

task "rename.rake" => :environment do
  ## Pega todos os arquivos de um diretório
  def files_from_directory(dir)
    begin
      Dir.glob(dir)
    rescue e
      raise e
    end
  end
  
  # ============================================ INÍCIO DO RAKE ============================================ #
  i = 0
    folder_path = "#{Rails.root}/public/pictures/casal"
    files_from_directory("#{folder_path}/*").each do |f|
      if f.split('/').last.index('.db').nil?
        # filename = File.basename(f, File.extname(f))
        File.rename(f, "#{folder_path}/slider_#{i}.jpg")
        i += 1
      end
    end
    puts 'Arquivos renomeados.'
end
