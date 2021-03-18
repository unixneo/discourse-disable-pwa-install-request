class DisablePwaInstall
  def self.modify_application_hbs
    application_hbs = "#{Rails.root}/app/assets/javascripts/discourse/app/templates/application.hbs"
    if File.readlines(application_hbs).grep(/install/)&.any?
      if ENV["RAILS_ENV"] == "production"
        tmp_file = "/shared/tmp/application_hbs_work.tmp.txt"
      else
        tmp_file = "#{Rails.root}/application_hbs_work.tmp.txt"
      end

      IO.foreach(application_hbs) do |line|
        IO.write(tmp_file, line, mode: "a") unless line.include? "pwa-install-banner"
      end
      FileUtils.mv(tmp_file, application_hbs)
    end
  end
end
