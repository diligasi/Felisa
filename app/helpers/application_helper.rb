module ApplicationHelper

  ## Retorna a quantidade de dias que faltam para a data passada como parâmetro
  ## O formato da data deve ser DD/MM/YYYY
  def date_diff_from_now(date)
    date = Date.new(date.to_date.year, date.to_date.month, date.to_date.day)
    today = Date.new(Date.current.year, Date.current.month, Date.current.day)
    # regex = '^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}$ '

    if today == date
      return "#{date.strftime('%d/%m/%Y')}\nÉ Hoje!!! =D".gsub(/\n/, '<br />').html_safe
    elsif today < date
      days_before = date - today
      return "#{date.strftime('%d/%m/%Y')}\nFaltam #{days_before.to_i} #{'dia'.pluralize(days_before)}.".gsub(/\n/, '<br />').html_safe
    else
      days_after = today - date
      return "#{date.strftime('%d/%m/%Y')}\nJá estão juntos há #{days_after.to_i} #{'dia'.pluralize(days_after)}. \\o/".gsub(/\n/, '<br />').html_safe
    end
  end

  ## Pega todos os arquivos de um diretório
  def files_from_directory(dir)
    begin
      Dir.glob(dir)
    rescue e
      raise e
    end
  end
end
